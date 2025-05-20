Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A58C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJ85ynw9ipJcKMSEafX6JidqWf+JlbtspiLh971BMRc=; b=ZKD2IpwnecEJkHUeq1R+u9JCVv
	oCDf4n2qAlK8M5RY2ZI9USRqcXgS53Os/uyS9GLpUFcFVQ6UXsM4TioDKi3kthIM/PRJzPYiHGQqy
	H+jPkBo+i13WQLf1UDfUFOR7KaoFdOmmikK5gAVeP0S83aXvUWO2+iOxEdBsHGojEfEczLJVv0gdT
	2ICCdjIYB/2+iaHkf0zc6bEwNfwIRUTjcWBb2d+XkSR9NxkCSNyw+mJjqJoOyyY4snrpl3KW0lMRz
	a2SQE33+pTjo5ZXdAqtLHywz7L4sj/V2mGebmxEjOrk5vHLjwTqQvV++eJ5alEp6TlfU4GoFPt7QV
	/wLwT/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSsf-0000000Dy0U-2iIV;
	Tue, 20 May 2025 19:44:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSaJ-0000000DvOL-3cDU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 186FC49DEE;
	Tue, 20 May 2025 19:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60CAC4CEEF;
	Tue, 20 May 2025 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769107;
	bh=wYtGxquDyb/uwRox/J1ebRNegYN8+f58D8Ohb3JJlS0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mq4MwtoLo5Wzyd5gbzrmxP+oV99rqMPjNFLimTHDS6kh+QWK3DB/s0UQU1SvFt2fl
	 z9G3eV17jA4/SCAfvUQ0gSpKXkJ4IOALf+MPQqyeEUjXcgnMr+PBiiE+yFs4yKOVdm
	 hjbPho3BuMrnPe+Y7HP2NefU2baF+2TYGc/n55HdbvJonXj/i3tSuCefsT8F3fZXAi
	 /zx+ap7FTN5+FV0heRFKqSTgsoO/ZjJKIR0wsh8aQnxVFbqc53v0I6Ly9wlevXiw4Z
	 hZcfEhDcYIeP2iuGFjrTw85RmvD0oMV28aiboXDYmQQP3ULxuU88QtkO3bykWaqlqj
	 uGVn8MAz4sHHw==
Date: Tue, 20 May 2025 14:25:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
Message-Id: <174776907578.1216009.15135400439348545740.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21 clocks and
 reset bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_122507_944652_F504D007 
X-CRM114-Status: GOOD (  12.16  )
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


On Tue, 20 May 2025 17:28:37 +0200, Gabriel Fernandez wrote:
> Adds clock and reset binding entries for STM32MP21 SoC family.
> 
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml           | 204 ++++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h       | 426 +++++++++++++++++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h       | 138 +++++++
>  3 files changed, 768 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml: properties:access-controllers: {'description': 'phandle to the rifsc device to check access right.', 'items': [{'description': 'phandle to access controller'}], 'minItems': 1, 'maxItems': 1} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml: properties:access-controllers: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'phandle to access controller'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


