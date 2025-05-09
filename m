Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6517C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwTawF8PqeIj4acmbxuSOUBysWkrgXkqCM2C3zY/xaE=; b=sqFQio9j0ep+GPmE1a9T9V0K0O
	pGxYCb9JYb44wz9p78KMrswO9Yl4GXK7WITnXv162pWHYyIK9cWhkmqDAmg6cl53AG0Nba/KSvkIa
	91lW6lC95DaqJtwnIGRj5VlIpK+fNXs7bjeFwSOK/9j6AZzW05R37si3y58POucs0YE8d66TPbRJ6
	qUtaIqpD2Q3feREd55+hbv58yiqo/2KEVp6KO1LpP/ZWd3Zh2rk27D/SY7jT/9TXk0l4LXE78yIUs
	uQNbVZprerEHOY985Ue5Rkr5VEPizFrapnh18bZpMp//Ybemfn6nhnpaMTp39KM9jVBPd2YkD9IEi
	qS3tKOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUKB-00000004pSX-2kg8;
	Fri, 09 May 2025 20:28:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDScg-00000004akL-0nae;
	Fri, 09 May 2025 18:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77257439FB;
	Fri,  9 May 2025 18:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5AFC4CEE4;
	Fri,  9 May 2025 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815941;
	bh=CNzigu9OBmuWrlsbb6lkAHKQvEmV0rXReJcmd4lUIG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOR3T+Uea/m9D1NaeSWXmmevBwXXe1rwMHM9tj20bdo5M/Q1Uz6xZw+S9DICifwPw
	 mq+MEqH0ToOrWY8bUhm2sARgZvXf4NJp+4wzxRfO0ygybgggqztpqAMvpqm7kehrlw
	 hELbnaCIrgfTjteCssiBoQPaMu0o0oO9jSFmt17Ugt91b0YEVY0KyRByE5AWVL3Egw
	 iMIpJ6ihhnprEpw8MmmEwfOE4nghtEPK5HSt4MtTLU8qi+T0u5ZphiQdat+TJvlTtU
	 /H5ahjFWOcwroMtB7aNubyLP5eN/MdKW6LyuF70OlcPx1kMmYPRMavi03kh3Edwb/M
	 OO+/gygR1OmMg==
Date: Fri, 9 May 2025 13:38:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Benjamin Bara <benjamin.bara@skidata.com>,
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Klaus Goger <klaus.goger@theobroma-systems.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: usb: cypress,hx3: Add support for
 all variants
Message-ID: <174681593868.3912440.12960505435883876267.robh@kernel.org>
References: <20250425-onboard_usb_dev-v2-0-4a76a474a010@thaumatec.com>
 <20250425-onboard_usb_dev-v2-2-4a76a474a010@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-onboard_usb_dev-v2-2-4a76a474a010@thaumatec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_113902_245479_7C0DCEEF 
X-CRM114-Status: GOOD (  13.95  )
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


On Fri, 25 Apr 2025 17:18:07 +0200, Lukasz Czechowski wrote:
> The Cypress HX3 hubs use different default PID value depending
> on the variant. Update compatibles list.
> Becasuse all hub variants use the same driver data, allow the
> dt node to have two compatibles: leftmost which matches the HW
> exactly, and the second one as fallback.
> 
> Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 USB 3.0 family")
> Cc: stable@vger.kernel.org # 6.6
> Cc: stable@vger.kernel.org # Backport of the patch ("dt-bindings: usb: usb-device: relax compatible pattern to a contains") from list: https://lore.kernel.org/linux-usb/20250418-dt-binding-usb-device-compatibles-v2-1-b3029f14e800@cherry.de/
> Cc: stable@vger.kernel.org # Backport of the patch in this series fixing product ID in onboard_dev_id_table in drivers/usb/misc/onboard_usb_dev.c driver
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> ---
>  .../devicetree/bindings/usb/cypress,hx3.yaml          | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


