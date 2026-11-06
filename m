Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A36606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 03:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vUl1t3AM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EiDnc6OL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ASBwV8LCp1C0yRJR8yBz3HjgWmYNCn4cK28x1+h41Lw=; b=vUl1t3AMuziuPvrKgJC6iMKWXS
	4BGL9sMhfwa9dBJO3nUppLqcqgFcwey0rx5buwRQ49On/17bVYb2QhypFDa39HPAvlP0efPCB5MwH
	4aSQMQInX79VlYUyTM49EMHBm99tj1cwPcta2OmXXoP9eDwLCQL8URp8dvs2jGH1f+92d5DaryznM
	9MgnWvTjFNj72d+sw9JNjNhmkkhiwh7djfC/LUsC2lcOCx7Hgi2aBILr+KPtmui70kpsX426Kt/y5
	NLTwEQTZ184isjTLUVuejdatZindAJNpxQVBJ/DdRPVJtLOmf7S7MJkv0TE7jBb4MisC3bTAepoF0
	Jo+k9SDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAEr-0000000B8JU-2SlP;
	Fri, 06 Nov 2026 03:03:37 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPAEo-0000000B8J8-3mOW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 03:03:36 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso67542a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 19:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934213; x=1794539013; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ASBwV8LCp1C0yRJR8yBz3HjgWmYNCn4cK28x1+h41Lw=;
        b=EiDnc6OL9XJCymsTiiEbhY7kxqCO70ejDx3Shzla+mM0Qr7GcF9mwk1TLvvT6SMDdr
         BDVfZJ89NluEdjSm+n2mFuoaCCoIaB27/sRrviahWThInznFX35O09H+oODmiwWi4YhX
         63fCvyWX1ThJkDFuzQwqdwejfkpE2YrYGxCYqTmezzZ2cJ3Pg1TZf0j4P/AOWQrt6ZUf
         7QnDmhRptFYEb5dHoih7FM/hGB/7V6jRf5QQM7VzJ5AtI0bzjxf8+Cgc7MHILBg/UIcw
         bVLQH/Eb/QJgIUcLC57AaWT8a2Hf3Tm/7NAxV9F0HuqcooqPdfKFdx69K7tamF3ehzC2
         bT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934213; x=1794539013;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ASBwV8LCp1C0yRJR8yBz3HjgWmYNCn4cK28x1+h41Lw=;
        b=ooGBdVGY3auntcBds0SDxpBbTA9cEYS9+olJaeOLJBbe6gZ9g6LrMZCPW0/JBqVwR/
         ehxyq8ae/a97uPJvx/b8DDU8E35ziBgQskDYLUm/FTuN16Kx2JkSLxc/5sGgsmWaR0fO
         8eR9REHOQxLBY4v7xqRPSMxL6R5AjG01K1zd7PUcGwh6Rf3ilV8NqMfFdB6F6cDkqqr2
         UI7a+X+Nz5qIjRaCrLlecIpRL4/1fDsjIYps2bkxl22DqsmDeYQR5nEFcRn9n+cCNzq8
         43BvNztmANEmE2ihTqXQNQbFGf4Jo3jS+1Be5hLmk9TGB31HdXGAr/+XssM64UUPs/pZ
         pmwg==
X-Forwarded-Encrypted: i=1; AL+hErFvYyvjaxnNgeSuk0P1gTG+a8BrfWgCqnDf6ETDrOPKbc9fcno3XetReK/wG8e7sfbjARIAk81vHti9PI1etb2j@lists.infradead.org
X-Gm-Message-State: APuU4Z8tmSWtjEX3T/X/DbSF2MFIf1QfpfNADHQxc+3pHbOywCxGEUma
	/uQoBRySnA7H6UjC7c9r3oVFgLECz/xyaEkzKxL0OS/QY1VgRv4M/kKZeSZYGA==
X-Gm-Gg: AYBFou3fgVZVoeBhgKPxfPPD2JLjxy9Plr9QqHQMn6Bk5wrcoisWd/cCRLvHhthZSJB
	x+8KxLG/GZKyvyaP6sgm3smkX57cQ40WNe8Ibj/2tFcS6pVhRLKN/VxMApTsiyYLViCDsWeenlD
	dWQ1zi3MIh200G4Aa5gLJD/TzzBIvTHi6Lw78X+t2ju6iqwyr0K16BtPceNWs63plH8VhBFN/5w
	QbemVhJdiLyz1vp76Jt/x9+KBwQr175o4fEoB0ovVESKgFD3wbdk7/63CNG0bOgjOxK5bxDZgmW
	aZEYTvO1AxSgI2Yt7V8WXESJtOs/4B21DvIJ13OHF89BaG2RTO74GletZfYxKXMo5ZfFsZNbFjl
	EPTuUQNu7dwVCJTkFYyAhsrUq3VL2J1s1/R9tgUjjicVpA+TMDS/1LMLzcUSEtJz9rwcnL4SFoM
	U1GgE/lSeL4xlN6ull+rJ6D10TADkFiXxQDPis6K/LCOSs2MC8fIM9TjIRZSso6bkG4GZFRFVFt
	9y+LmBWmshxDDl/yFiasqI83lpsilpRFoJbNv4BsOY+h2/nJAnA3GP990yoNu+7tiUJV37AZHSS
	wPRUfEn0ahfWl5wSLBGtIjJP6uM4pcl8ORliwgK2wOUCtHLFle+m3pq9fhsymS/1zzjC
X-Received: by 2002:a17:90b:580b:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3b0db5f1545mr1108730a91.7.1793934213421;
        Thu, 05 Nov 2026 19:03:33 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a04a39sm118179a12.15.2026.11.05.19.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:03:32 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Subject: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
Date: Fri, 06 Nov 2026 11:08:01 +0800
Message-Id: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFE7WoC/x3MPQqAMAxA4atIZgNpwQ5eRRxaGzVLLf1DEO9uc
 fyG9x7InIQzzMMDiZtkuUKHGgfYThsORvHdoEkbpchg41Bqshp9yVijt4VxJ3IbTYqcdtDLmHi
 X+78u6/t+L/W3CmUAAAA=
X-Change-ID: 20261106-ventura2-dts-update-f00bc0510b2b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=lolMIAz2iXzBafL/lg43sfocr/VCB+03ulE0SYBkY9w=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq7USVOT8QeKuwr2nO937gkCr2m3czU+Kauuu5R
 Ff/aIhYg0iJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCau1ElQAKCRClg0K3CVbE
 gSf8B/oD1Abx+lgUrMKZp4jqZ4rjfgY7XYOnLkKCQ+AcALPfduyJpsZtMbx22AX5KN7PzEfQHAA
 Q/SfNl0TNPYfvUrUY9jUMgDnO2Q4tmpGbYnknhRIhO74j83UJE6qZtY6ysbkRBXyAO80TDR69al
 QoCoo5LgWgHJFakOvIAssoBw1hLpXHVf9rZOLBp0vNML9TG5qTy1zyzhm8bgi15lHbyGh1ddT7t
 74jl3hmLFNxdocqFABdW5mmyXJiASzCHyGk0qj46Q62UgfFppPcNSagfBYWBcpjCnQtjEcDXyrJ
 E1PXGhN1Gkjzahj/sAwoDUy9ljzq0acArWGGeWU+98BbEuW1
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_190334_946072_C43D1ED9 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series is a follow-up to the Ventura2 devicetree.

Patch 1 describes the three LTC2305 ADCs fitted on Ventura2 and exposes
the valve voltages read by the bus 3 ADCs through iio-hwmon.

The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
dtbs_check reports a missing vref-supply for the LTC2305 nodes.

Patch 2 names the presence detect GPIO of the optional COM Express
module so userspace can determine whether the module is present.

Patch 3 names the reset GPIOs of the three USB-to-UART bridges so
userspace can reset the bridges.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
Kyle Hsieh (3):
      ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
      ARM: dts: aspeed: ventura2: Name the COMe presence GPIO
      ARM: dts: aspeed: ventura2: Name the USB-UART bridge reset GPIOs

 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts    | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: f4dcbba2ec358f7079daddcda7594dad9746326a
change-id: 20261106-ventura2-dts-update-f00bc0510b2b

Best regards,
-- 
Kyle Hsieh <kylehsieh1995@gmail.com>


