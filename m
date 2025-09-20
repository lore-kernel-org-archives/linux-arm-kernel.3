Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3907ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSI3VckpD7CHAKqWHV0G2q67lpmUbI91NOEpha6163c=; b=pTPImPpL8jtd41I7mUmYkGT7Jh
	ACLrtfQlixS31bfRzYGGFWVrhqDSQKOLOYH3wK9+M2FTHVLVTG44OCsiNg2TTXxKC3mdmBU5CpJnO
	TwcUrZqG9YjecO34krvs0G01ANBS0NfWGo9N0dnqeE1EPOeGpMAQG5ES1CZr9lB2lGyYSusQO4Rf7
	nFmsxQJu8z9H+R/s+Bp/DHXKwV2I1/6TScTJjDycgdJKgr5EbOvJkTBBnhl8TLx0e1SDFZuJKnABG
	SHrORhVhjWDVGxJjV4jMBzgmz8v+rJc2mdBoDTc1xbgMz2ubVoR5d2w9AcjlFuZIQ49xQ58SZ66b/
	cjeCl5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v016q-00000005fdD-1HmL;
	Sat, 20 Sep 2025 17:10:52 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v016n-00000005fcK-28k3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 17:10:50 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=KWOTw+Bj4OOXsGaJJvWbSUILi4HVd/QLUfoPr/16Gp8cZtp1ULhP9Uvde66AYpwH+WOk0EbAxWbrC3JHegoga1Gd5SGcaipmCa+ETY0SU6gft8I8jTz8nrWehQvVHM55Xf/avlX/MAo0XVcMSQzllJXv3x409IJsiU6w+SkkSQ93s8R7rYZyQWRCBBm6eJmP+l4a/Hyj2VKbaC+W6w6aZSmHGs6K516FFesf/Kp2srxyoz6EKA+M/ElqYYUcZbQ4Zy8ZtjCkviIokVZqkqesih8R1JOSnR/TzIuCj5+oqKO1sKZKR4D8zv4a2H/XAXZa6Y6NiWpI9ETmEG6UHvRvvQ==; s=purelymail1; d=purelymail.com; v=1; bh=RSI3VckpD7CHAKqWHV0G2q67lpmUbI91NOEpha6163c=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 362739118;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Sep 2025 17:10:05 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 20 Sep 2025 19:10:02 +0200
Message-Id: <DCXSLGK9ONQV.21BWV4YL6FG4E@mentallysanemainliners.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 0/2] i2c: Add support for MT6878 I2C controllers
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>, "Qii Wang"
 <qii.wang@mediatek.com>, "Andi Shyti" <andi.shyti@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_101049_647681_0677452F 
X-CRM114-Status: UNSURE (   9.27  )
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

On Sat Sep 20, 2025 at 5:31 PM CEST, Igor Belwon wrote:
> Hi all,
>
> This patchest adds support for the i2c units found in the MediaTek=20
> MT6878 SoC. These units use the new v3 register offset scheme=20
> (differing only in OFFSET_SLAVE_ADDR).
>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Hi,

Please DROP this patchset from the queue.

This patchset can be simplified into one commit (only bindings changes),
as the compatible data is 1:1 from mt8188.

Sincere apologies,
Igor

