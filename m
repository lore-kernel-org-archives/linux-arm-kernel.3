Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAA6C36014
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 20:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFxQjhwgGjgwXR07IRfDibfTQlpNOIRjJpt1yIGy69g=; b=a8cacfUbcJuKWCBg8jsP4Wzc3w
	iWHgLzsduWEPhWBZJ9wXPie4qO/d9X62shx1OvVBOt3XHFj8YD6Hp+WVwNdW+YL4TJIdJuI6KCWkC
	9Gv51x2d/JWefF6KiMk64V5YrRhxiSvOf1PbkvpqwgYaACDKorVCRrdzPrDxcOSVhRO1dkw/wAykB
	mAW4/wcP8JPhqfFowob6Yqes0Ky121oKV78DY94Jx9YuqIkAKQNb8yNY+yEA+xtRpaQ8pJQ0V6u5j
	hVrMVAMUsvSn13zCTlUSlDvjgQJJnMuIEOTk+Z6/rjBnCc/oGIoLKI6VSkot8AZYG+4gSgg8XrkNC
	f4r4Dmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzLYX-00000001IKD-2xHs;
	Mon, 31 Mar 2025 20:16:25 +0000
Received: from 7.mo560.mail-out.ovh.net ([188.165.48.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzLWj-00000001I2E-2s2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 20:14:36 +0000
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.9.217])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZRMmD5YbCz1RX8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 20:14:20 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-4mz9s (unknown [10.110.118.186])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F374C1FD74;
	Mon, 31 Mar 2025 20:14:19 +0000 (UTC)
Received: from milecki.pl ([37.59.142.113])
	by ghost-submission-5b5ff79f4f-4mz9s with ESMTPSA
	id mP8fM5v36meqRSMABD4k1A
	(envelope-from <rafal@milecki.pl>); Mon, 31 Mar 2025 20:14:19 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-113S0072c0309d9-39e6-4a93-8cf3-8f7db1d966e4,
                    EB34EEC9BB259E122037596A09A6C3749AFF5F1D) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 151.80.29.22
MIME-Version: 1.0
Date: Mon, 31 Mar 2025 22:14:19 +0200
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: justin.chen@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, alcooperx@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, kishon@kernel.org,
 vkoul@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: phy: brcmstb-usb-phy: Add support for
 bcm74110
In-Reply-To: <20250327185623.3047893-3-justin.chen@broadcom.com>
References: <20250327185623.3047893-1-justin.chen@broadcom.com>
 <20250327185623.3047893-3-justin.chen@broadcom.com>
Message-ID: <4a9f8974a6d140c0aaf8d51740015b15@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 89.151.31.88
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17842135827268152153
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeggfffhvfevufgjfhfkgihitgfgsehtkehjtddttdejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejjeekkeegjedtffffveffieevtdeuieefueffgeekheekleeiudfgleefuddtueenucfkphepuddvjedrtddrtddruddpkeelrdduhedurdefuddrkeekpdduhedurdektddrvdelrddvvddpfeejrdehledrudegvddruddufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=rFxQjhwgGjgwXR07IRfDibfTQlpNOIRjJpt1yIGy69g=;
 c=relaxed/relaxed; d=milecki.pl; h=From; s=ovhmo3028686-selector1;
 t=1743452060; v=1;
 b=DGaNuYR3Vb6ebIPRorCaBJPzs/hqPv+vFRb51vMWOFRETkwbanblEU9AijlEgHSb6/Oh5d0C
 Au8wIr8LF78SsNnDMRp0ThKwZel6RsfrqJ56OHwDrMNCZLFLR6kz1QmIVQeQDLrzhtRhPv3eQhv
 bolqp2XCRqj8jv04GfBI8jDSL32hE94P8kGHjz8k7Lt39aJf6j9Y2WWmZDG3cnXU+R41cX+Xyzm
 DMpmCGjXB8K1MznRrUNtKMC/otF2J9gpG+HAU2UV/tJ+qohPC2Lz33d/SmWwg1G+f5AKmv9r0iy
 lqEWCN9c7zCWaW9RAC94cti5tfRAt5S03ZpjAea1G1Xyg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_131434_589423_65A23F92 
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

On 2025-03-27 19:56, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> bcm74110 brcmstb usb phy adds further power savings during suspend
> states.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
>  Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> index 580fbe37b37f..2e668935b454 100644
> --- a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> @@ -15,6 +15,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - brcm,bcm74110-usb-phy
>        - brcm,bcm4908-usb-phy
>        - brcm,bcm7211-usb-phy
>        - brcm,bcm7216-usb-phy

Keeping those enum entires sorted would be nice for maintenance.

-- 
Rafał Miłecki

