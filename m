Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D360A2603
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJohO2G1;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=izuVT1y3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=; b=dJohO2G134/0tWIBG2jNppqeqy
	iInYVOqoIP76MrTnj+WiAMaTf4eO3oG9Rh/xg3PYMkPAgxj66aadQK+saNbzxkyx7PmSLtBlc1wPA
	WvV35IbrGA9BmL48Abmme6e3a4KDZWFMehY1/20jOO8+It3oylt6G8onplvf7CI7EI7GLHi9tOHfy
	JVjRJ8BuU1hLH6OoQbHFEwhHstqHLNliEXnD/8jTakQWx+95LltMEU3pBY2KYxzBKq7hDz6X6PsiC
	BCOcrSpH50XLMATexPOchy3Pu8SyX/svXjXbq0LKQ0SetSdgKcB9SAr9s2bKoQZ+qD1TfT61VbIAk
	KG/Yd99A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xk-00000001Z0U-0C6O;
	Tue, 03 Nov 2026 08:33:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9xg-00000001Yyt-2jU8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:33:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso232882a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694824; x=1794299624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
        b=izuVT1y3ykaCJjq9E8oPIjwVeHZ0nsNNlsJq7r5jhu1WKenxU9wDQ1K4DcknxAmFM5
         xppo8ihaI09k0pEuN6vaEfsF+K6zlwImbieQIjjk+Jg7XBSj7ItRj9yo6BdKKQpvGUax
         dk9HSTv9G/zUsqBz/zJqhnYOoXtrYFWDBhFk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694824; x=1794299624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfUT22bku5FLHKqPn9/1kA2CO+HAUQbPG++n30nYh30=;
        b=k6+GHcqjcpPRkTpftJ4Ky60OheK6GgLNLYelQqo4uBRCscGUMmQ14SRw/RkKxrUt+4
         VIPWymigIH+KQ7IFhQgXtmrqZCpJemKx1Otw/8eadEZElWBCQUkHPKYy1k8sdQVCpxTK
         bwnAYVUguEl18M3A7kNRmuPq2GT+SxVhoIg0XN0OU6dS4zlXltN24rxhusYCzceNGNvH
         8zZxaQKTdFsSyZ/2OTz0MM6L/+Nt2lN/PMe5qI8Jbl1Jsw1td854mbMJkDnPN6WCGWys
         G4S1vYp+7F26AWrM5dk/TNNQjq3/TGQpt3QU9QSuU3T8BwsVrhYyNKd2KiCYgNyowIyj
         abGA==
X-Forwarded-Encrypted: i=1; AKwUvByLH2gMvgSAdJIxjVnTWKEIv94+xPTJXS+bKziXjWvqTcPawgs2SOcO/p1ufa2tUSMHPhv4W4d2NrY57FaIwByw@lists.infradead.org
X-Gm-Message-State: APuU4Z/N76BffiPcjB5RMZfuIz6YAMEA0RdIoF+Y5BGoZOzEY4SdnUU1
	/D5k/GmyzM7aokWJ7yrQ3V879tYyrGb7a1qVDUBpkR1YH81NarGea+rqgiRbKEihaA==
X-Gm-Gg: AYBFou0fKm736h+SerDHSK9Wp+bqaa99sftA2+pVzez+V4n/3sHjgAt9odLIlr3pSsr
	vuDJIfVkBu0CdNBnZ2ty8xmi6txFF9pG4PDKKcpGlvrDwfSQRrjw9F2GRu5/Shu4XllUObYGgAW
	MgAVAXz4+PRGYOvwAA5fhW1oWfoYtRpTHjx9ogREvtsZiFTsjqLwatlJcMrZHs3GuPRHzcatEuV
	2cWlrKaAJHsbKUg6+YKB5+v/LcOOTDpznbwSO5BL6488nSBNYq+wn1uYajUfnBFE9txDwWetxWY
	HNfq/L6bx2Qw7roRTe8ZIiaQ2JfSmXWjMkBqet1aZyfNJsIIpVVb88hift8ASHvdR/ljgysv+Cz
	283L9DIG/OQfgKtwiYeR6Bc0B+cy1DY6pxroZuLWnOyrg9Pv/Uri7wUEn7c1KGkrsS4akUWPD/j
	duKVtHlpneu4DXmm9X9ZStbZwgzK++D9pi7wmN9r8V+1QpLnXpj+pm509SS8QkYTaLeL8GPYSY2
	KYS3UJVPmbExwq+5NDI+52lzhPRdUuPQ/tFELtMFTq6ANPPoSDufBU7KNP7nZ0Gz7jgnGfFivlN
	R1pbkvlOsNJ+7CxNaMsSLzXB4pvEMTilfHm22sm/zbguJ3ySe1mgvKB+xy+WlaXap8IMcrXVmus
	dI5mvDM0b75STGg==
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6781818a91.28.1793694823651;
        Tue, 03 Nov 2026 00:33:43 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:43 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: mediatek: mt8390-genio-common: USB fixes
Date: Tue,  3 Nov 2026 16:33:31 +0800
Message-ID: <20261103083335.2944847-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003344_722535_93E8DAEC 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Here are a couple fixes that came out of the MTK XHCI binding fix [1].

Patch 1 corrects the USB type C operating mode (host mode only) and
graph connections.

Patch 2 moves the pin mux for the USB hub supply enable pin to the
regulator.

I don't have the actual board to test this on. The changes were only
compile tested.


ChenYu

[1] https://lore.kernel.org/all/20260916075745.3549953-11-wenst@chromium.org/

Chen-Yu Tsai (2):
  arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and
    connection
  arm64: dts: mediatek: mt8390-genio-common: Split out USB hub enable
    pin mux

 .../dts/mediatek/mt8390-genio-common.dtsi     | 57 ++++++++++++-------
 1 file changed, 37 insertions(+), 20 deletions(-)

-- 
2.56.0.385.gac671c819a-goog


