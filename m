Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B193D12D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 04:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WfU+DCLSFXTTWqY/0GBuu5QNsIrraPKr9is8ul8Bwk4=; b=aHZK2fXihDtxjD8MUqq2MsEaaz
	waVwsHmQUzKScrJMfCx64t6QS0RzHo45O2vBnOCZpbK1V4dx8+Tefp3AWAo3ARRPDZQCXDpiTf0fe
	jmAcAmOveytzw6FX2AeK8UWZSqI0idkmNBglFOestSzZa2owlS2o8a5fI+MDNsF8cGg8CEcaPrxQa
	Y5+cRKxzvaYvGfVA9Cbzlvb6tTYh+GzxRP48gyDFG1WSeJhttIl9YTrDq34e10fpeS8yuKs1751ak
	apZo1Zj8ZYrCIaTk8yf/lhkRIS88q5ny8usuVaHpLJ3OoT/hrqcKBA+rMBxWzONQ6s0NTFSomEH1k
	04g+h8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAMTG-0000000GMDT-3t6h;
	Mon, 11 Nov 2024 04:56:14 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAMRU-0000000GM1T-0IGZ;
	Mon, 11 Nov 2024 04:54:25 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7181caa08a3so2363775a34.0;
        Sun, 10 Nov 2024 20:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731300862; x=1731905662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfU+DCLSFXTTWqY/0GBuu5QNsIrraPKr9is8ul8Bwk4=;
        b=SbcRG4cdcyG9FUKvauOBc+iULIB2b94Uxx2G42siA3dRuZ8hpoReqQ7OaGcNOluSTb
         jh1/QoNWnJ3VMXkT+IBxoORnlbCAtsANkD5T6lXA0d1fYhgNpnYOEijZoixfg5Q+TUqa
         GW3myQX6fq4VCCAdQYaJgEGZ9vz2arSt/3OtgrUf2H1aHe7OBX4CCDOCpAfkzSU7RdmW
         eprH0khydoDIwWBQPN/bmcUKjxwUP+8486amiyf6vsdxHmUkKLabGAkF3tz4Bj6q34XG
         /0CCs5UDVQ9Dhdd+BPgH5DD0123rhSKq5LPw7BmSYwsRVCxlTyBBPjZmYQgUU/13oqE7
         LjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731300862; x=1731905662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfU+DCLSFXTTWqY/0GBuu5QNsIrraPKr9is8ul8Bwk4=;
        b=Awc7RF424yL3t8sCZkxV8EcRD3zM2UtBqUd5n1mQW+mL++0apMIursbrG1/ZZ3SXnv
         nF0UZ/X/331mzR/+VlSTBJvk1nxR4WCU0A1xqg1C3fkgQGUg9kLYOyBfScrYEraYwsei
         ETBGacWLgSg3Hcsvt75N5/lh0qJc7/XGuMneBOxAksgn5ow1Xk5snS3C2m4Lz2aA8a92
         jEt4+ysTBXIYxwGNOqQcFnWob/zd8C6Ma5oq7HM4mAaXFP5k0UalefcZFWWk5UvfS3C8
         34or53xAzAXr1Em2RXs7G52kpEcJ58xFHP3/eRj/7f5/I0JleiOM5kfHpCubMCV5Df+P
         ccnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDyOZ78LoxxMjdAnw0IdOFd/Qy1M4TRVDN8vPosfAgVuLzayhNnucaM+aJHpi76FjAIi8YMJiGii5bXMA+3ofJ@lists.infradead.org, AJvYcCUHQi5f9M3r8rsmavGgczXkwy373ez+5hdGdUERw8f5jnNB5+VRBNEXFVJ/kCrbJzuNNd88izQXyz5hrLJ2igg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOyVBuyzvid0bosTrj5TxKquRx9uD0M8jb+PU2RhHyLeGWZZ8
	Tb+7uC7q3btAxl3LNgz5t2OeLDfc+v4CnLtu/GYwag3bdgfpB9RCQDeZSr0S
X-Google-Smtp-Source: AGHT+IGYEP2RVp/kn0F2tRfWbBkLhU/d5eH6DoN2VVDURkQxnJobNXAUOv5x8hfqX1Je54ugdEflHw==
X-Received: by 2002:a05:6830:6481:b0:717:d48c:593 with SMTP id 46e09a7af769-71a1c1cd328mr9932310a34.10.1731300862171;
        Sun, 10 Nov 2024 20:54:22 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:9ab7:85ff:fe20:5865])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a107ebd11sm2089439a34.10.2024.11.10.20.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:54:21 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/3 v3] arm64: dts: rockchip: Add Orange Pi 5 Max board
Date: Sun, 10 Nov 2024 22:53:21 -0600
Message-ID: <20241111045408.1922-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_205424_133752_DFEB70D6 
X-CRM114-Status: UNSURE (   5.26  )
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

Changes in v3:
- Refactor to share common include with Orange Pi 5 Plus

Changes in v2:
- squashed commits together for initial board file

Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/

