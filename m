Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42839C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 12:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrafXZ+fTOV5Q0yOHTKTlBFYtkynKxA292LQeLGoU8c=; b=YgrU+fL0+A2/6o2ik6RXR5FN9G
	NH8H+8pd3T4n9255/ZeVBLsXpyiZqnIqQw/vi3JneSQ3BVee2fn0KrpZwxOMlNMiv/nEcfjuZRJ6b
	sf32Beyqs3wwRAGi+rQ0Qk60JrmCzPJJfVRgumG35HKxSy0hbsxw6+3iDvtnFJja93+7C3JnaB1kT
	wNvWiI63mVD6gx7E2a8IxFLid7lpY5h33TIvexfdVij77kZFVaiHsmF4ZlnXTK7P4OK7BoS67Vg1F
	+KW7YlivmszKNMjZtrNUiG/xTEK3Z16UDSlqmPDQd6wehXatfgal2QBHOY+8rvvWIk3qoeVWHHMe7
	jiA7ZKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twK1o-000000019EW-1NKX;
	Sun, 23 Mar 2025 12:02:08 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twK08-0000000190q-0XIV;
	Sun, 23 Mar 2025 12:00:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso501125166b.0;
        Sun, 23 Mar 2025 05:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742731222; x=1743336022; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrafXZ+fTOV5Q0yOHTKTlBFYtkynKxA292LQeLGoU8c=;
        b=ktxIIgLAHZ4mw/hhO67M3YrrhJUZ2kUzuKqJ/xwgLaBlEKth0WzMyq0jjDCdbSgp1Q
         xfz5RvdVRiM11JavGPwAuVmrlGY4gf5ZpYFEvXL9Bxg17ssO2cUo+/rNNgq8mCzg60ux
         NUPGWJNVW8K0mEvHu3mWHhNT12byMwfuEk2scXg7PGSRKMXNB9o459QAcpLEPiOe+iwA
         UhUS3PtqaPKPq5r97Or1Fc4MvFDi8nKl6264hCTotjfo76blf6XPo78VQ9l6fhyJmBzM
         vjQ2YvCJbSW9LaeZLbzxlFv8pZzF1O/mIVaIyRlSOiYLEincjamBEA2NrLMqr64BzuT/
         fXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742731222; x=1743336022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrafXZ+fTOV5Q0yOHTKTlBFYtkynKxA292LQeLGoU8c=;
        b=Fybag0wY2q4URLLwJPd4YxxnVlrZihWu6G/Y26+5+eKWTxTB1eRKbD1IV8956pqFqM
         7fvbsWbMuKBb6TEi2grgCt5vthDcf52facWqCVe67LD4pKkrgEr8pU1DQH7Oxfj11ndp
         WU5GTUzXnGt7ij1GRg5hjuO3NSKFf4ROOulRibNySsXOMhmR19eQhXJREsuqWj6hT81a
         dXhlXEGkDbEK0FP2Obekni+tVg95IchbdysvvIljdNUuhJz+7WBUAYZhh+KOtn/KrVAi
         BlC3a6t2YlTo7qMkKjEqoWWTT3R8z5P+bzs1qSUHKR8w5MlW/9hln3LpOCFDQP1alsIm
         i7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUCgf1UpEb5+yAsPQimkZHq65Yru/02fkL6ZlYPkF3zaOXWBstgCCN+yCEnowac7N71J2PnmeSrQ+Sh+NeXzYI=@lists.infradead.org, AJvYcCXtZlxMMBRx3vs9bnTgt21vXqug4VeY/8mfp2uhP6eWeczejVBoMA4NyCN8Aq6h5RztKo1fTNvY2RBPTz4IRhSZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzCwHDcZdUw8mcxcArplfTwkiP3pCKmyXgdcobdzK7qf8d6kPCy
	lOHsZ3pY7DuazA8lBMejaZqnpUa5UDF3VFxk6KydVdSSzh4IhZXPG/5X/+lSAEnq9TCBzCD8mO6
	2QA5sZIlWrVvlGzR7YNL+PaT6e8A=
X-Gm-Gg: ASbGncu66PqzxosK4TP4+NvlsPQ+8x/UXBWNHNStJIhzQ3VGT7YBy0zhb9WUBzPA676
	xWC0oIxnb8owgrvjjNKdKukoNhG3hk1m/5B9ge9/ajo23hx1FSWrtfAj6XmCBONvNyqQ1U1nge4
	WmNYBAKp9/J9sHs5+KiDo+LXm2oA==
X-Google-Smtp-Source: AGHT+IEmwD9GqpgkQgN9NorTx5No1B/GDt3L++LgVtbFkWOFIhvRhQ5KQtfTXg5yPa+PtmUd4Pl7jRU5RvGVuuQ4xus=
X-Received: by 2002:a17:907:a58b:b0:ac4:3d0:8bc9 with SMTP id
 a640c23a62f3a-ac403d08c9dmr677975666b.27.1742731221681; Sun, 23 Mar 2025
 05:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250322141910.4461-1-qasdev00@gmail.com> <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
 <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
In-Reply-To: <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
From: James Dutton <james.dutton@gmail.com>
Date: Sun, 23 Mar 2025 11:59:45 +0000
X-Gm-Features: AQ5f1JqVpB_XbQHhuZx8L6OtYWjrN2ZY-NMIq6Iv9-4jH4hsP7HUUWJ477xKkmg
Message-ID: <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid potential null deref in mt7996_get_et_stats()
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Markus Elfring <Markus.Elfring@web.de>, Qasim Ijaz <qasdev00@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bo Jiao <bo.jiao@mediatek.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_050024_171410_EBDB42DD 
X-CRM114-Status: GOOD (  12.33  )
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

As a security side note in relation to the following patch:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 66575698aef1..88e013577c0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -68,11 +68,13 @@ static int mt7996_start(struct ieee80211_hw *hw)

 static void mt7996_stop_phy(struct mt7996_phy *phy)
 {
-       struct mt7996_dev *dev = phy->dev;
+       struct mt7996_dev *dev;

        if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
                return;

+       dev = phy->dev;
+
        cancel_delayed_work_sync(&phy->mt76->mac_work);

        mutex_lock(&dev->mt76.mutex);



Prior to that patch, the code looks like this:
static void mt7996_stop_phy(struct mt7996_phy *phy)
 {
       struct mt7996_dev *dev = phy->dev;

        if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
                return;


The compiler will completely remove the !phy check entirely because of
the use above it, so it being present in the source code is completely
bogus.
If one actually needs a !phy check to be present in the compiled code,
one must arrange it as per the patch above.

The fact that the !phy check is in the source code, implies to me that
someone, in the past, thought it was necessary, but I think an opinion
could be taken that it is there to obfuscate a security vulnerability.

Kind Regards

James

