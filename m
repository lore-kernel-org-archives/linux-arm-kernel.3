Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A4ECD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqQ6L81IE9YBE3fi3koB12kN7wxUftAgDIkOWTfCY8o=; b=XrKQ0kFS/OA9LZb+gkqb8omI9U
	JfWoL66f79CGnQGb3dpjY6dut5zG151NCKnHkwI5rExAhBAXSGppOsK5g+21QOytS0nKintDuXYAK
	4arE/mrMHRkTVbggDiWDk3idqoPYJ9jTOSz/f7WNAwrpPDyqUI1wbKjwTNehC0vPmNMOUoV30HZ+V
	ZhCzwJz6GwU7riyQ3xcj8rwxHclHdyuNEj2v8zTXgUxKXPGxyBlwl7rSRdZoDpskVDQgkG7XiqdKJ
	kmeG4kBsrCbpxVpQ4+/D2+x9JuQNKRcg/N/8kMu0BA20sSLTbNO1OWgNQyNHjvV6oNs4vJKmDeoR/
	Yu8h7iOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBds-0000000FbPr-1K7O;
	Tue, 05 May 2026 09:00:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBdp-0000000FbP5-3R8d;
	Tue, 05 May 2026 09:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B0AB40B9B;
	Tue,  5 May 2026 09:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73AEC2BCB4;
	Tue,  5 May 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777971633;
	bh=q/NatlP+cOQS2FmvC7zHrLNZ8KeWMGRc9gqXfXgWdIE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Hd2gXySX/yopYveQ7ncqd+JJxc8m6aieD1vGJWHaXXGkOMVFdYUNrAKL1bg/Wz2Zw
	 m02e1kw5xEjz4DRaZNRvCWJiMe6CxA1obf5297rzFoE0oQhwTlNL6Dl0y5d2akJURZ
	 pvlUZZHEPPihMWjNF7RBMXwLdvMTiQ5vatUSE5qpWiRwbSKB9FWktUzA+AB1cXwV/0
	 SZ+GokEtmPxemeWde0C0e9IdA1snN8dypwKniHjbY9kYJlR2iiwt51/88Wd4nLJr+j
	 XG+iDHKM9h1t3XiKeq6Oyo0emqs60ivK30sH54wfK/T+HP+PCRXbKljSqVuFHMEsnl
	 so0BNnYIRNfww==
Date: Tue, 05 May 2026 04:00:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Eric Anholt <eric@anholt.net>, 
 Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-rpi-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-hardening@vger.kernel.org
To: Gregor Herburger <gregor.herburger@linutronix.de>
In-Reply-To: <20260505-rpi-otp-driver-v2-1-e9176ec72837@linutronix.de>
References: <20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de>
 <20260505-rpi-otp-driver-v2-1-e9176ec72837@linutronix.de>
Message-Id: <177797163082.1577508.5643979416868173390.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: raspberrypi,bcm2835-firmware: Add
 bcm2712-firmware compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_020033_876221_2A303A34 
X-CRM114-Status: GOOD (  10.62  )
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


On Tue, 05 May 2026 09:25:09 +0200, Gregor Herburger wrote:
> Add a compatible string for the bcm2712 firmware.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  .../devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260505-rpi-otp-driver-v2-1-e9176ec72837@linutronix.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


