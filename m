Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAC8C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O8fWycJvdwJ/W6pQ9mNqxjashiEaKH5pjJ73XaWiG04=; b=VW/5a0TT/HO0DeHkG/06DZSuZ5
	QJDE/AVqSEDT2M1E8uhLIPOFHHp8/U4Zk29F/rayvqVe52Zwlf27Cax3nHNfWGE/D6AYYjDvwavx4
	zgmr54t1Jruxg+hK3ipxm0UfXJCcKkspnXQxkc9yUbrVYcK2c/LnmEOfuc04s9ibEWXwvGJXr6klq
	GLaylBsStwTSAbqHVOttHG7eBo+mkwYWtP9wyqmImhh100kTeeLiBtEibWtGtYzIaZkDcbExU9h/9
	rA5ZR365/HMvgBX03Q0WP6/YRIvM4N0bOUw9pwEyv86AnoGqCAd7QOjWC76cUfQ5tKjZ3D26D70oT
	0kYPI/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AX6-00000004Vg0-3IXj;
	Tue, 08 Apr 2025 15:06:36 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AUe-00000004VGT-3n8V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:04:06 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-739be717eddso4470373b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744124644; x=1744729444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8fWycJvdwJ/W6pQ9mNqxjashiEaKH5pjJ73XaWiG04=;
        b=HN4HkMNASzsaCvfoLYsvHd8ppYprjnK1JqRL8DtdH5+PFWcVCjdwbNbJJqc+EPATxi
         xWAjSO8yjeXvWzf0W5qeAxoYIHo5mXWjiwPL2vG9m286e8N7ula68YO2MPp4aaHS6AAi
         EhRuu6FY0/pue4tt3SET6WWDlchzR63pQ6+gWcCpa0BruKqC7cs8Ewbe+t2jbR8x7x/7
         1n5BMyU8CAWyyIqu70A6Z77Z5wadyTiInRHlgMu70E88p7ZuDfxM3xXSue5Jipdxehe8
         CqErEVdcZcM6UQAkB7lKOuMj5QUkkCvOcmkrqB8fWNNObSltxiLYXk989EoRqsbYnP5F
         xjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124644; x=1744729444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8fWycJvdwJ/W6pQ9mNqxjashiEaKH5pjJ73XaWiG04=;
        b=q4lL1U03soUJIxVAGZOrU5w2y22opo9qkxpzOEvLiTEsy0RYtbuaBHisRKzN19GPGv
         d8+hZIarkXa+pLvVgFBd1vwrMBklRqHI9IDfJfmnZ9joCmXlnla8D/4j4o/GiEZhIv0S
         JtaShYrrmsaHCaFLSQTpI122qD6Lo09IfhqeNR7cBSLJfv49aXToOSQjidJzdKrCiDQK
         69DNpdQIJPJ05Hm+9fgcTZTnixPhRDUzbfSrtsK9kPfb661tnxOyC47VQTlASN51mLvW
         o76HZLLEAijqyXEvSXrDOPRdKLy//tfC3XjLZ7xGzvRBTEKdxh6oPcUrl4WG+yjyMWa+
         94UA==
X-Forwarded-Encrypted: i=1; AJvYcCWtV5QF7w21pGN0NrrkMm813bfMxZoq89DT4eGluwhUwQvyQatRr/1jRIRIB0dDMq0jan/jn0ZHlYUr8BwiYQ5j@lists.infradead.org
X-Gm-Message-State: AOJu0YwlXtTTM/NzOHK1TZzXZYcluqnh3qv6TcQieEgbHvsfmRLWM9ZZ
	siAQAIpCqdc3BWexW1HJMUuXjPsGIP7w5UyPQlIE4ZjZeGvmcnke
X-Gm-Gg: ASbGncv0oJ2XcKzjEM0Rmz2fFpRzTrtO6cDAsW/0U7YglD2yTsDRYknz+SuDPuBI3dh
	f7dKwm9bJwueG2iNBFMISENRuU41YlI+NiuO1ppna69n4oDME7fnCbXC3zy3jYjA6qzYq2zlOcR
	Mk7VKmIRu9zXf/ZwJraW9zd0DSUeMVbnZERQ3aluBd0sDnyLgxcp9b4rwQoUyhI5nWjAaqrHvrw
	DRtVUOc6qhDwTOT0iAUzXkZJIITcxb4PteDTpGBldFG/XJHtOLKl6YE3JXA7JWPX7q6j+rNs7vB
	QMl0YB1EEya9gBaeGa3JoivWgNnA2VXS1SdLuanBjoN12a8AlQiyeZTBmxx9LgBTnRZc4Xelj/X
	kbS9Xww==
X-Google-Smtp-Source: AGHT+IFmr2DimbBD7TGGduHkaksfKx7Cu1H6lgcQktUMtC0UA/F2Thx2FeH+vbcjDpvPVC3DCPlH9A==
X-Received: by 2002:a05:6a00:3cc1:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-73b6aa3db66mr18058531b3a.7.1744124643494;
        Tue, 08 Apr 2025 08:04:03 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea097asm11068474b3a.90.2025.04.08.08.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:04:02 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference in get_rate()
Date: Tue,  8 Apr 2025 23:03:52 +0800
Message-Id: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_080404_938854_4B735A7B 
X-CRM114-Status: UNSURE (   7.97  )
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

This series fixes potential NULL pointer dereferences in scmi_cpufreq_get_rate()
and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.

Henry Martin (2):
  cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
  cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()

 drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
 drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


