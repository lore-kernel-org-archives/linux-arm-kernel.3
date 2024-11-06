Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0FD44D59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syhoxRXbUlwbHZydJCqciiC5oWyLOG8yVgrGl7kOOY4=; b=JyZYuVHT+78yeHT41RxHcTX+WJ
	ALTv8BVs3I7a6zDX7MxEU7xuLHOGLf9YxeppcmwfzwYE6dQW1b2j9Ia3B1TafG38xk79GPmIQ2Jcx
	EhHVFk73BQuBkNQkm23hSIX3ozZ7QK3Myb5WSvppKqLtdTG0Bj1BXIfU4j3rfSbE/tCJ0L1BYzMPN
	qozl5uHjI55uX2H55ReOpXpS6xHpCoQ1EJGNQYs+EwuJsec5VKG82E++lP9WuB4NGbXmmjt/jrbww
	JOU95vAoRPBtql86Jr6q2SC20M/Y3oBLTsTmovdAb7x+Bbz1FPUKSDtpQUsKix/5i6Fc1fPzdpxHK
	FVTBE7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fuF-00000003NT4-3a5X;
	Wed, 06 Nov 2024 13:17:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fBo-00000003CW3-3cNT;
	Wed, 06 Nov 2024 12:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730896269;
	bh=LVZC9YpZah6uXDvJdeHUW9uz3cIFHxVPayrxERGQ/I0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEqlfwZ35IDW+CM5840xi/LD0qYJrHKIGHuIVbIsTh6Sw52PI1eiH8Es99IGl8rhy
	 u43JHdoQEQyTpfylBX+9WGP35+zI9XUgVHgak+iPomNEL0ZDR0CEes4N5+tQxfUHHY
	 h2QrXuYVoTj+tmZd+WWWBOnAKh7suJNA85m2ssCek89nraACcwbsXmsi3Z6e+USA3L
	 DUkBqk9JFYKgmqcddpKHTBlrH7BeqqRpN5lhhyDb7Rl1sci4sZ5TlvAU4lTUYrHsYp
	 yXdNEN2AfuU9d10dIAVuI18Sdw7Gyv0WRW/2vjfJIKQyBsU1/3NkwPrVT8DsTZUvlD
	 xpbFEKjrlg/xQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DA0517E3626;
	Wed,  6 Nov 2024 13:31:09 +0100 (CET)
Message-ID: <8f07284d-f5c8-4de3-85d8-ef87e58842d5@collabora.com>
Date: Wed, 6 Nov 2024 13:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: mediatek: Add support for MT6735
 TOPRGU/WDT
To: Yassine Oudjana <y.oudjana@protonmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241106104738.195968-1-y.oudjana@protonmail.com>
 <20241106104738.195968-3-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106104738.195968-3-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_043113_121474_2F81868D 
X-CRM114-Status: UNSURE (   6.95  )
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

Il 06/11/24 11:47, Yassine Oudjana ha scritto:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


