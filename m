Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A461E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtcDWrQ73jqFojmLKyQfLZ0En+VUeMI1nsaGNeWKho4=; b=djz1RHbyspMLgDXLPXI4Dal5yd
	eiuSS+T+TADF+TLbigZK0t8p9gcK/viFTwaVQmnRXnJJaefGkjjCWcLAGIDBjXzyFpUUeqg8rFj2Q
	a69EkKxLvcAH5e4RuCqEGopuzQr0eDLc7llqoIo6ZVhFXgSdSaGcu+5DsqlEBZJW1W4GJBNL1spbc
	1EePHX2m1iaG7fXYc6tD9MLaQqn9DsTudojF5veNps+ZjcWEyyFy4zObxm7S2irtZZdQD4SKgg4TO
	vc8srCy6WDIX0KdAQw//6wn1GO/T5uUYRu6gG4yLVtiGO+wlispgEb2i7SCHGsVodcF5TJTbjnp87
	oTanzg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMx1-0000000AgED-3LKq;
	Thu, 02 Jan 2025 15:17:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMvj-0000000Ag2W-0Ptj;
	Thu, 02 Jan 2025 15:16:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2162b5d2e1fso19308585ad.3;
        Thu, 02 Jan 2025 07:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735830969; x=1736435769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtcDWrQ73jqFojmLKyQfLZ0En+VUeMI1nsaGNeWKho4=;
        b=aqlgOdLBU8P0uqfGI3C0z0d93h56HlxftuzL2TvV5/zlFYzKcGEHFJG+eU28cQGkXL
         4UjzRS7/WZEQyo3KDp8bnrBbGdkjj+RkyrN2dX5HDTA6eLutvaLqiUN3GEXOlI7LgIsa
         JG++F+DJLHBgb2L3qwW8ebOO+UBO7uW8uSYVaZb/njTsjSN5b693uie2VcAYWbSqUwcx
         ivSz7PqpJsb7/x45RnbmCgN/fjmgoo/V2OqmQ47oCEL9D4uY7BNGt6H2PdoxSIHaoEIy
         Yzo3CNYy14KGy5UYi+SzjqplXOLRLjONSyP+pRQL/HVrTD/V8lO5asjVLAh6tpdVkDzX
         o4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735830969; x=1736435769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtcDWrQ73jqFojmLKyQfLZ0En+VUeMI1nsaGNeWKho4=;
        b=hY7buWzclhH6bRzvaHjIj3W9cyGI/BSyjYAMLTIM0MOtgBUq07DkP+pqWe/GKukvo8
         0wfxYjCpPJpFdiHqxEozphxum8iAvo8yXQJ355uVVAREGddVVXPcOLXLgqmuaG6BCp8h
         acpUjao60R0AZcEe7yj3HHEuwQXPQdNOfjDye6A6y7WFfeqcmbUjTHfEfMu8k4XZr5fa
         ZPBuTxhR4wHWEZo9NkLTUMaDvkzmtZEBBWZLzt2LH6BlJrJsICzCgL3suzPoX4apjBUP
         utMCs3d3B41yZsDc9SMRrgXo69g2gVf7wVfkTxQMdnTIBDNoTzUzeRQxgmZRspuJCXng
         9NFA==
X-Forwarded-Encrypted: i=1; AJvYcCUFOlizUbD9Azi72eQ5ly6wjGsWHDEjsWb1fP/whTQLow7BNjP0K43tjKAy11JSwOdR/SS9Wj564ymb@lists.infradead.org, AJvYcCXJK7oY7Lxo7eoKPdy5BbhAaPmDaCD+6FdE82HsoQE10oVayzxhhKg+hl34CxtzTtsKzGIL9v03yevoE23lI2Y=@lists.infradead.org, AJvYcCXKzP2B3UNX9UgIpX0Thx8v+z3WM3ZIsb6hzTykOwlDVlumY0x/9y5UH38Ljj+1/QL03SLabUchhgSR/qcnOJn/@lists.infradead.org
X-Gm-Message-State: AOJu0YxfVqITELwLgIcCYsYCNdtGMk3AmJJ/S1aCQLvfiNfOpA57h5+P
	CiwSs9mXJiNHWf+ctN7Da7ARFdXCCX9WJGqhyYA63ZZHoIG3tjYw
X-Gm-Gg: ASbGncv6SRGTKPyMQVo5oj8xTRoJKRmA2/IE5gJuEVQ0lXAzt8WPUpCrZcM2+Txq617
	KDTA/lU+7GqTfW+Dw2V5znVCQMc6gB9G4TVPQ6gDl0tskhXj0zIendaLDKqwcFE4KdEZ5cUNRAg
	Sy0g0BRbVtJUhhSM5gycbvxkOhjzO2kUWTAEmdvOcyAQ7lMq3GiHpAy/GVBNcoWJVkZFf5Nsjhm
	bw3dNrJ7/Xw6gRpbAqJbykBb32iztCmyFhY1mm5tiuPcqKs6VsoCMBi0ZwXYQ==
X-Google-Smtp-Source: AGHT+IHe+s25vVgZEo61TLbYoVVK5tzaLM84BfZLH2ZP8ydnTSroc2lABkTLtHU9g42UECtOP/2X8g==
X-Received: by 2002:a17:902:db07:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-219e6f0982cmr236749285ad.10.1735830969185;
        Thu, 02 Jan 2025 07:16:09 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972b29sm228998815ad.111.2025.01.02.07.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 07:16:08 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: vkoul@kernel.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	yifeng.zhao@rock-chips.com
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
Date: Thu,  2 Jan 2025 23:16:01 +0800
Message-ID: <20250102151601.2615178-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <173367712869.1031947.3262464465649332012.b4-ty@kernel.org>
References: <173367712869.1031947.3262464465649332012.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_071611_160736_5218EB09 
X-CRM114-Status: UNSURE (   6.79  )
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

Hi,

On Sun, 08 Dec 2024 22:28:48 +0530, Vinod Koul wrote:
>Applied, thanks!
>
>[2/2] phy: rockchip: naneng-combphy: fix phy reset
>      commit: fbcbffbac994aca1264e3c14da96ac9bfd90466e

The other patch in this series:
arm64: dts: rockchip: rk3568: add reset-names for combphy
is missing in v6.13-rc5, which will break pcie2 of rk3568 because the phy
driver has changed.

Best regards,
Jianfeng

