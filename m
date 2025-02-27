Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D26EC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGi4qiLf9rsL71QgwWMb4PvJdyymrfzxVqDoj0cQP6Q=; b=WNIN7MnXfLJ3+8lRjXJv1mYVFj
	GHcyj2FU23UKVqQmZkFIu8f9zqfghYE3/zsk/WsvBo1v7wM33VZJtE3J6m6TmWmPblMFuG31kA6JU
	IsrYfzX53QsRK5K27cmTWkjzGTgk5jMUoxFUZoKAUtJL6MF6yAcZIFdbvNBx67tFbZniJ4nWKvut0
	XQmUm1hjFxuca52PFsA4fYUjxWuZ+ysuDVJN3zsM9apcfv3PPqPVHQLhyYVs9fhxNFh3hL8ANcy31
	z+FnnMwi2FcV36pCivPxVfADn2eze167tqlGJ6IyS6WyYLK0ndLU+SS1ZRVhBUL3Q3LHu6wx8Khq6
	k6pOYixA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnckI-00000007JKL-3NPY;
	Thu, 27 Feb 2025 12:12:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncLK-00000007EEU-1hxB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 11:46:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5461F15A1;
	Thu, 27 Feb 2025 03:46:31 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADDB3F6A8;
	Thu, 27 Feb 2025 03:46:13 -0800 (PST)
Date: Thu, 27 Feb 2025 11:46:11 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Chen-Yu
 Tsai <wens@csie.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: pinctrl: add compatible for
 Allwinner A523/T527
Message-ID: <20250227114611.67a1ba00@donnerap.manchester.arm.com>
In-Reply-To: <173949598874.895319.6861900349653451498.robh@kernel.org>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-7-andre.przywara@arm.com>
	<173949598874.895319.6861900349653451498.robh@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_034618_551760_2FA7FB00 
X-CRM114-Status: GOOD (  25.05  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 13 Feb 2025 19:19:48 -0600
"Rob Herring (Arm)" <robh@kernel.org> wrote:

Hi Rob,

> On Fri, 14 Feb 2025 00:37:32 +0000, Andre Przywara wrote:
> > The A523 contains a pin controller similar to previous SoCs, although
> > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > With this SoC we introduce a new style of binding, where the pinmux values
> > for each pin group are stored in the new "allwinner,pinmux" property in
> > the DT node, instead of requiring every driver to store a mapping between
> > the function names and the required pinmux.
> > 
> > Add a new binding file, since all the different variants of the old
> > binding are making the file a bit unwieldy to handle already, and the new
> > property would make the situation worse.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../allwinner,sun55i-a523-pinctrl.yaml        | 177 ++++++++++++++++++
> >  1 file changed, 177 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
> >   
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dts:24:18: fatal error: dt-bindings/clock/sun55i-a523-r-ccu.h: No such file or directory
>    24 |         #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ah yeah, of course, that's in another series. What's the best approach
here? I could cheekily import an existing header file, the symbol names in
there are often the same (ccu-sun20i-d1-r.h defines the same symbol, even
with the same number).
Or I just replace it below with the number "1"?
Or let git format-patch append the patch-id of the clock binding header
patch?

Cheers,
Andre

> compilation terminated.
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1511: dt_binding_check] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250214003734.14944-7-andre.przywara@arm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


