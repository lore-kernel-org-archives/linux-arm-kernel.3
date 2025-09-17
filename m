Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F32CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 02:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hYZlavsGsYMvMuDImVchJjtEZ+fzfmDCFdAdekFJbZI=; b=nm9QsUginE8RJ8WYx+Cqr/GZoG
	l4fAkjsWPgWjnqzxNepa6UmiYWn3TajDC3L0FvZrMEkD+3KOFi7GskM+SvCX1DWn8MQk8J/PJHknT
	ZKGZTPir9ontjfy6UgtfrHQ7qFAnY0LWUhDWaD/ermAvtr2g8vR0tuLgufWcEXxQz/zPo8OuaEnxf
	untqwyDA8HkK3AbGioYIGAV6kIGDEQrcAYQUTseLLibPwT3E6Vd5pcqAbR/0pbXklIPCiRFvIA5nV
	8ABXUYZdH9WXk6aa3ghLg+3GrRg3bfr3menqJKnPIUj2Sv0/dm3POu9KQi8GOg30hG9jRiImvwO28
	8XKITIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhjn-00000009wJE-3G4X;
	Wed, 17 Sep 2025 02:17:39 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhjm-00000009wIo-0h3x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 02:17:39 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cRMqJ2bZnz9v0X;
	Wed, 17 Sep 2025 04:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758075452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYZlavsGsYMvMuDImVchJjtEZ+fzfmDCFdAdekFJbZI=;
	b=DX3J95GhEEhGIvepllIW1gmmWf0NPMQvhJQFMI49rUIuIMXMIn5Qo6wzo6JY1iggIlQMUc
	YcDwdic1zuXlJAo3XmnPW2D/wqdcKYGhsyzgBrC/cno6G0eOfE0TGlOrSpO8svVrBpDqRx
	o73jTD+rknZIf6w/FIEaw/lQPvpinmu+AAy97en/ChFRNiTrE9I1RJKsK16MpqYXqeRas/
	/7roj3JKFTMTR7yIh3tt5coxmJ7QT5HkRdwzmylQgAncGCwfkSg/3orGqK4ApnJDK7KNmS
	DQe2azn3QnTS97yXA2AfwUsWlKVTgmA+ACg18GO9Vvl6sNXIJdeD7+hv9i5lKA==
Message-ID: <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
Date: Wed, 17 Sep 2025 04:17:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aMoTtr9KmdrgDUiE@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dfd0912c7d1407435e0
X-MBO-RS-META: 7cm7ougi35mktp3698jjkyq6oj4cauw5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_191738_353483_FA216078 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
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

On 9/17/25 3:49 AM, Rain Yang wrote:

Hello Jiyu,

> Hi Marek,
> sorry for the inconvienence. this uboot version don't include SM-184's change.
> I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
> or build from source, or raise one ticket in this website[2].

I use mainline U-Boot 2025.07 with about 10 extra patches, but nothing 
significant. I don't think this is U-Boot issue, is it ?

I can rebuild SM, which commit in SM (from imx-sm repository) do I need 
to use ?

-- 
Best regards,
Marek Vasut

