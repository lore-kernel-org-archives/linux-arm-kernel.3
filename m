Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3959CD2F7D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeQ5w9JI2U+u93WcNx+OHZKvHgY1tekXmNamojx/WOM=; b=4hMTdoRUGUopbbSupdtHp0zvEb
	joAiH3RqLnbjUB0m10Ptt4syXSFAoDmGS4ZkQyKMzh6S9FGal84NzjCzvPpJ7fKjj4huNos6E1ASK
	I/0A8lOiDx+0gkBXSaIRXAlZMfvTJZEe7l+Zg/dXfAuY/ZuAQoTD/f4vAzNRJXp4hg53DofeDpt21
	H1j4+QYaoyw2mAdH8YmwqYgs3JRfGfx076XIg+JxAyFvG2kEl/Ikh+cBnZ5XZ7KrUo71V7LoPC4N2
	2i+04AjZK8IL3+/AMEpQiml8S7hKrf7WnPMUdwNT8PWi4q4rksNrjlmV0KivQjw5HL/SSphYaktbe
	z0XgjkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSnY-00000009N8Q-2O81;
	Fri, 05 Dec 2025 10:12:24 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSnW-00000009N7i-0wmm;
	Fri, 05 Dec 2025 10:12:23 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id F40571003CD;
	Fri,  5 Dec 2025 10:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1764929539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeQ5w9JI2U+u93WcNx+OHZKvHgY1tekXmNamojx/WOM=;
	b=TXv64BkeLki+uCVapB3Qw9iYC0d1w3GX22KoNiqmVfI8RN3PqITLubCD12mQWDudWXgnRO
	ipsHTfXEYchZhwhYfx8SU5BcB4JsIt0vHRLBMm6ynVpFOzKXq4taCuAPHUZxSGK3aJqROX
	OghncKRLnPfraPEkjfHp4KdOAMWZDPY=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4B772100681;
	Fri,  5 Dec 2025 10:12:18 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 11:12:18 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank
 Wunderlich <frank-w@public-files.de>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt7986: add dtbs with
 applied overlays for bpi-r3
In-Reply-To: <fc5c9829-96fa-4028-a642-0792699e92a5@kernel.org>
References: <20251119175124.48947-1-linux@fw-web.de>
 <20251119175124.48947-2-linux@fw-web.de>
 <fc5c9829-96fa-4028-a642-0792699e92a5@kernel.org>
Message-ID: <942df0f5995a2929eecd38e4066865c0@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 58a40c37-ab18-4aa8-b309-90bca7573869
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_021222_489295_E6CC50CF 
X-CRM114-Status: GOOD (  11.32  )
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

Hi

Am 2025-12-05 09:10, schrieb Krzysztof Kozlowski:
> On 19/11/2025 18:51, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Build devicetree binaries for testing overlays and providing users
>> full dtb without using overlays.
>> 
>> Suggested-by: Rob Herring <robh+dt@kernel.org>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>> resend of
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20240608080530.9436-2-linux@fw-web.de/
>> due to discussions here:
>> https://patchwork.kernel.org/project/linux-mediatek/patch/20251117211306.725678-1-robh@kernel.org/
>> 
>> changes:
>> - updated sd-nand with sata-overlay
>> ---
>>  arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
> 
> 
> This looks like still not being applied and now it is a warning in
> Linus' tree.
> 
> Can this be applied and sent as fixes?

afair the series was sent after the pull-request from angelo and maybe 
he waited
for an ack from you/rob before applying ;)

if it helps i collected the commits for (possibly) sending as fix

Fixes: a58c36806741 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc 
overlays")
Fixes: dec929e61a42 ("arm64: dts: mediatek: mt7988a-bpi-r4-pro: Add PCIe 
overlays")
Fixes: 714a80ced07a ("arm64: dts: mediatek: mt7988a-bpi-r4: Add dt 
overlays for sd + emmc")
Fixes: 312189ebb802 ("arm64: dts: mt7986: add overlay for SATA power 
socket on BPI-R3")
Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")

> Best regards,
> Krzysztof

regards Frank

