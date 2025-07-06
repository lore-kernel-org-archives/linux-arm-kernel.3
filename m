Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB195C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYWZdxoaeuNRULoCUvX6n1zva8dtZJ5TxHg+sbtusUw=; b=KV1VMmKYhyLQ4YnQd1zOeYxdYX
	PUrUhezYJvyu/1mliumKVBeF8afYSnOkX2LVOOoxspixdt8O0dcpWDaRiQdzaWcn3b8bHeWpPDo9H
	gp1Kcx7hkI+gNKCaM/9P8ixi/96dCm0v0vy+urooPlXPxVaQqJ8y7OLfbOWDjuEMKxeebkKH6uMPR
	FAo4sOwfZrI3dE5Lv+8XN0UqU2Vebok3HEi+1o1IrIO6zEXEgm9yctlJuvYKa2HZCMoJOgwAz7sDn
	PO4WlygIh2Uk9IrQRFFvsH9cwnj3NSEr4opwt9s4jelXylj3m/NkHgtsOyjP2dV89gMEhysJoc0P+
	y7cwW24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRpz-00000000ULs-3DCk;
	Sun, 06 Jul 2025 16:03:31 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYRna-00000000UE1-3EIJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 16:01:08 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4490925D87;
	Sun,  6 Jul 2025 18:00:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfGpzETI8X29; Sun,  6 Jul 2025 18:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751817655; bh=QqDi1RStgwI7SrzAhimWgxfHUwpuVvnky+gt8gc+YsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OwY2RPG9td5uiPFxBjZ4I7dlIVsvfT4FKxJEKKMLY9Z+m/dF55l9G1/ltHlJIv7Vx
	 c6g+UOgwLX2x/REBm/MFuXNRzyWTEF6oZ8tmMO9QbkoXNMsgDQSRgQHnacHqUOtj0n
	 l4lu9kEgQ9qE0fS4WieBLDKfXayTvuZPDLWRP03G8udZ4B7qa2bgh++A7aOenCOGqf
	 BuaGy4MMTKgQlPgyyM83CR6d6mWOzW3RQfKy3hn8zFUfGJlCrMRHmNFIxY/HivfRCC
	 QPzDRGnRVvlu1buMJ4atFs5K9mBjp1Or8wxfBYQ7bN8Z3TsEKQOztQr8xT5BcX2f9L
	 gEUk6WXymRf+A==
MIME-Version: 1.0
Date: Sun, 06 Jul 2025 16:00:55 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Ajay Kumar
 <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
In-Reply-To: <32924ee3-2dcd-43bf-8dec-51f85675bee0@kernel.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <32924ee3-2dcd-43bf-8dec-51f85675bee0@kernel.org>
Message-ID: <4e5d50807f1ae86aaf0e3c351b230b1b@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_090103_227266_7DCB007D 
X-CRM114-Status: GOOD (  10.67  )
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

On 2025-07-06 07:33, Krzysztof Kozlowski wrote:
> On 26/06/2025 21:20, Kaustabh Chakraborty wrote:
>> @@ -80,6 +80,14 @@ properties:
>>        - const: vsync
>>        - const: lcd_sys
>> 
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  ports:
> 
> This was supposed to be port, no?

Yes. You have reviewed this patch though, I didn't send a new rev
yet.

Either way, yes this should be port (since it has a single output
port).

> 
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Contains a port which is connected to mic or dsim node.
> If you are using ports, then you need to list the ports.
> 
> Best regards,
> Krzysztof

