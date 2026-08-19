Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E3C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9qFe+jEsJnb09dRNVDkkZlzIonD8UKNe3Rg9EAkjE0=; b=AYCzXDMieCmEYr83Gazpqt/kUB
	Hk92maa713TJQGn+KFwCTw4pcy4r5UtU/s0Tt/aIzqOhtQfQgP1NkMsUCImoFwgS2bFLHjtZ8D9tt
	NM5Hpuf8so60YFdlnk8YELb8FwxQ1KOeoiApw5mb/KB+JhzQX7zqWA0mTv+8Hn52dfNc7ghoA5bd6
	/dP0lrPTNGzoL9bTlg8eluZfcQD4vOsZeOmB7hyhSstZhqM5ITdtkoSeEwoA7+XFsvN1I0IdCa5w4
	jhfd2QgfT+s8TdEyrEP1KG1/ucW4mnA6ooQIE/33cw1NXcAKQ1DJnajm+I447RQGsu9muyrtEf32s
	7t+M+3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbQG-00000009I46-2UGa;
	Wed, 19 Aug 2026 08:13:20 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbQD-00000009I2v-35pj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 08:13:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28349BFB3B;
	Wed, 19 Aug 2026 10:59:36 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1787126383; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=V9qFe+jEsJnb09dRNVDkkZlzIonD8UKNe3Rg9EAkjE0=;
	b=h31gRPB6PJ2B5wvVWz56MsBIuXcx2If/lQlji5TmC7QDi/jicwekZz9J0vlbYb5fEBwzny
	mD1wYPjbu97xYhrBJOvh5f00W4O/7TCUgY0Lh8QRSJz/58Yv3nRHGEq2w6GbHVP0eSF6BH
	G9+uJJ+LkstTdCVqe08RFlfFql18JTmBJO6XggW7vWSGPdEPNcome4BbBU/j8jrKx0zf4E
	sNYX1zkTGaxooteT7CdfMkR5JjDYClLEAJac+WW5tUBDfMODpgbYAnCEecYGJS4/Tbs0MU
	dpYRjeoYkfJxA0NUjPRlKN7QYU5+oRNP/dSiudUIaCNqkxo5XF9ChlKmonfPbQ==
From: Vladislav Leonov <vlad@zlab.su>
To: joshua.crofts1@gmail.com
Cc: andy@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	heiko@sntech.de,
	jic23@kernel.org,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	nuno.sa@analog.com,
	robh@kernel.org,
	sjg@chromium.org,
	vlad@zlab.su
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106 compatible
Date: Wed, 19 Aug 2026 10:59:21 +0300
Message-ID: <20260819075921.14356-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260819085255.00001e60@gmail.com>
References: <20260819085255.00001e60@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_011317_978990_D10766CE 
X-CRM114-Status: UNSURE (   6.07  )
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

Hi Joshua,

Sorry, I forgot the Suggested-by tag. Should I send a v2, or can the tag be added when applying the patch?

Regards,
Vladislav

