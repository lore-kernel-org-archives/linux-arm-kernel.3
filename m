Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6F51091929
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAw/k0C5attSt6i0ggF9Q/RDjzK5YsEYXKmLjLTvE5s=; b=gOFRuNeiIaLDYRoCgGsW1XemiG
	EJVQ8GvSrt0DmLMkOsOrqHCK8O/TRWgYJ7UAK86hkZfNGvt/TslwAIO7SZHYpzUgnOvKt+amkm/yX
	J6s1vnbRp33Z+2MFwRi6jlV7KZrpXEfW1PFnfrOnQqaen8Tw2J715aGYlT36nvZlvhI5HbMfEJY3H
	yCQgzyk7b3Kz/ci1SBeOEgbS4Ij3n+1oreSmes9htNcLAAmx4/X1Bd5zlhJaPEK8crh0YubVFpjoK
	dkM0gXCFtf6du6MrHThZaaYWslUNPLQRsnN2EQg3yARZK5u34+xgfs4xQEtDLjuIe8xbKxWJXpcMO
	bVyfWo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LnJ-0000000BdZV-0Md1;
	Thu, 19 Mar 2026 22:24:45 +0000
Received: from flow-b3-smtp.messagingengine.com ([202.12.124.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ln9-0000000BdQK-1RK5;
	Thu, 19 Mar 2026 22:24:36 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id BB3D213000AA;
	Thu, 19 Mar 2026 18:24:33 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 18:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773959073;
	 x=1773966273; bh=SAw/k0C5attSt6i0ggF9Q/RDjzK5YsEYXKmLjLTvE5s=; b=
	Fc+arHKtRHJlof7sDMeqd4qyveDomnENaBy3hW1BBPrh3eYlYolRYUE9xKOyynMs
	F6+Z0Jnm7B11eosynz9mPBmWLtLRAjPVIeR56+POjl2QU6iG59EM9DpOGDX7B5Bm
	QKp7KFQlNRelhkxfvVRFMHZzCfuiB5vpZ7wXujMb1fjHqf7Jfc5d3oikP3ZOxjUB
	f0Ot6lstmaHDSLLkJKj9BRNJp09dHXMlCvIHafIN3N9qAnMXHMtcjZvC4dFkk/Ir
	vVVA+wDDEEN6A0uVKqHyytsHMvWmDEJlU5wqhMuxb9y7a3+6Y7jPxsCG3To0sXWT
	GVSDguUdocNguFz6ftzamw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773959073; x=
	1773966273; bh=SAw/k0C5attSt6i0ggF9Q/RDjzK5YsEYXKmLjLTvE5s=; b=N
	g2yr+h/A4BJcAn0i+q3obw4sLvmkl+HyqpuSpdSPDBf9BIH9J2UEMUdh96YleGHX
	1TFnvzKD2nzkqLqtpKKCiM35uuTy5B5IQcls/7XgeNW5WjkaEy9DGzATXZwD8fRL
	VN2p7TuAY+z7ENCOyErCsMdEPJ+AZoc4eQGSmxxhrgV+lF4AW5GJkwhv5EE77uqH
	GjH4KBy3xEJeI2Y7cvlQaMqDwUQJiM4OqXYLjqXC5VJ/z/vKm7SymylUEYWFcrGj
	zY7YqHkgjY6R0W9DaHhD9vPOuv6dvBQuf3g5GyzKcfnYTeQFDcNvyaN5g+ARRS6f
	9ax3wM+kBa2UcHR2+7O0w==
X-ME-Sender: <xms:oXe8aRASLQG5tRRI2RqDtcrTwES-0MsqkQgtH5IkQgELJSpuD_e8Qw>
    <xme:oXe8aaXkuWDqJdNzm316krnGYX8bC7fHBs35XHDVoOm-s9HjzItysIE2P3eCaU9mv
    X9MjfQq4ON-aI63WmVsTJdT9Y7A0CrNk4QtZO10aQPVsTgdg-vz6n8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthekredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnhepve
    ektdfhffevuddtgfetieevtddvheduhfeggfekveejlefhleefieevueefiefhnecuvehl
    uhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjh
    gvthhmrdhmvgdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllh
    grsghorhgrrdgtohhmpdhrtghpthhtohepfeduleefieefudesghhmrghilhdrtghomhdp
    rhgtphhtthhopehlohhonhhgrddtgidttdesghhmrghilhdrtghomhdprhgtphhtthhope
    grrhhivghlrdhrohhsvghnfhgvlhgurdejhedtsehgmhgrihhlrdgtohhmpdhrtghpthht
    oheptghhrghpuhhishgurghrihhogeesghhmrghilhdrtghomhdprhgtphhtthhopehgih
    hoshgrlheltdesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhhihgrshdrsghg
    ghesghhmrghilhdrtghomhdprhgtphhtthhopehrrgguohhirdgthhhrihhssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshgrmhhurdhtohhljhgrmhhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:oXe8afw_GReFjLKxgdYJ3x5DgqigYILt0lJhAeT8-21f71hqeTHahA>
    <xmx:oXe8aUf9xB8zNnjQBSLscWzIWrvuTKsbR6q1PkO79Pi-d7m2gjIe7Q>
    <xmx:oXe8ad0ZmYkD7Gk48qL-wWzA5FsgJn5yG8ZHlnLzmgZ-ddDslgjpxA>
    <xmx:oXe8aVuY8bYZ3_omHG5klG9nitVuKLnpPU8keQLRt9qlNwfX9qevsQ>
    <xmx:oXe8adTul46dGTEjcFEDhUNUjPG3q3O0MVFRkjWbZD2AoIxvI4PPFGIz>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6E6201EA006B; Thu, 19 Mar 2026 18:24:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Thu, 19 Mar 2026 16:24:22 -0600
Subject: [PATCH v2 06/13] wifi: mt76: mt7925: add MT7927 chip ID helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260319-mt7927-wifi-support-v2-v2-6-d627a7fad70d@jetm.me>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Deren Wu <deren.wu@mediatek.com>,
 Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>,
 George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>,
 Samu Toljamo <samu.toljamo@gmail.com>,
 Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
 Chapuis Dario <chapuisdario4@gmail.com>,
 =?utf-8?q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
 =?utf-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=floss@jetm.me;
 h=from:subject:message-id; bh=n0VciTfuPJYkEWYOBKshZAqe01K78js0TWEDsMztS5U=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpvHeRwsMQCIWBjFQGkbW+S0VybzR7BDgGLEP7U
 7SNL9HosQaJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCabx3kQAKCRC17sMLqGd3
 H4gHDACwTGzUKCDn6pLqZ7N4xps91CqW7E6fUD9MH42scCB3CXw9rcUfVNM1lXip07OVy5O8DH0
 2EPyP0m4k0rL9Vin6fll6iOZb/wHRHW2VPlx/7nsZOCpTMdfWT+IrbkTRbZ0u+PA8dyspiT/Spy
 BerNugOkxXAkVFWA4D2GrwVPn1V45VxV9F4FCMG/T4eX3COKWKSAWjEN7pjAE3fjSNFGbqDKpJf
 PSpWJY+qwB7uIErlzuBF+Z3FnSCH4oW0ixbWcdn30nd6qnNBRpLSQLGurk0pEBp00eF2WKp4NoB
 fixEDMUj+f70B9qdGx44wuq/ckOti+JYMa0PBkZQKq6ipYxUDks/y1EoAuo6krNc/3oJKtf2FLq
 lorHgL5WEXQaYl5KnUWfmESXUbLYYmOa1Eaurs6Y5k01L/FDvabN4VZxNZufInxXljRLf2t+Hfp
 X4Vf4FyyxSzqxBn6b9XJgGuEfcmjuY39buwsk2jl3XxrdWct4K+TsZOBX7h6NcRV8WKjE=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_152435_787470_192BE4BC 
X-CRM114-Status: UNSURE (   9.15  )
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

The MediaTek MT7927 (Filogic 380) combo chip uses MT7927 WiFi silicon
that is architecturally compatible with MT7925. Extend is_mt7925() to
match chip ID 0x7927, and add is_mt7927() for code paths that need
MT7927-specific handling.

Also add 0x7927 to is_mt76_fw_txp() to match MT7925's TXP format.

Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 554716e01ee6..bf578bf467d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -174,7 +174,12 @@ extern const struct wiphy_wowlan_support mt76_connac_wowlan_support;
 
 static inline bool is_mt7925(struct mt76_dev *dev)
 {
-	return mt76_chip(dev) == 0x7925;
+	return mt76_chip(dev) == 0x7925 || mt76_chip(dev) == 0x7927;
+}
+
+static inline bool is_mt7927(struct mt76_dev *dev)
+{
+	return mt76_chip(dev) == 0x7927;
 }
 
 static inline bool is_320mhz_supported(struct mt76_dev *dev)
@@ -277,6 +282,7 @@ static inline bool is_mt76_fw_txp(struct mt76_dev *dev)
 	case 0x7920:
 	case 0x7922:
 	case 0x7925:
+	case 0x7927:
 	case 0x7663:
 	case 0x7622:
 		return false;

-- 
2.53.0


