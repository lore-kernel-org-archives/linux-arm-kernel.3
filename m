Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9273FD132A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Subject:To:Message-ID:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=; b=Lj6B1xNBMWIdZlE+cbqgKfxhYR
	++To5MYkRd9jwGLPL0abiph9+O8cUkL46zWw3pfFXTcDpK8i70Ufqulthi497yuV1EkL1GLJgd9st
	sgz7d1zAp+2sjPbXd1TkUGmSGPu1aNyT24MZfIVCvRKT3yntCA54eBwNtV1C2gh1SRKbPFmkNwbFg
	MXdOiMhcoxgjkrT9T0jXV9ttohbtCvJ2y69TtZTQ8joJgHkah5gKs7yqVktljo9jC0tCB8uEuGnRq
	ejzUEoDPdYEb4+l0A+b9crTYj0vyMqQCHBiRYWMX6Y1nkNCYY6tUjpKG2KepluGQe5mF8J0+W6Feq
	cL9Awkdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u6m-0000000DHdj-0HEm;
	Mon, 04 Nov 2024 10:14:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7txz-0000000DFnM-0K6K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 10:05:48 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso35037375ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 02:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730714745; x=1731319545; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=c+VTMlNZhGTHtt6+10HupR5mveGW7tyyDXJZvoTu0nurAs1N1Hf7ednlwCUowrW68C
         qLwlEJKLFbV2K3OQUiCgfd+cgAS+pqoWdFniqUnMITi0dM4FyJCNsM7QxhhPRwDbjIx/
         SGWt4bkX1KrNi7Ew9Cv3f8CwptonYtCCElw1FOIrSXoJ70Kb6Qm7HIv/mHvg3rWnPLGG
         sdK/ppSsuTkdtvul6f+EhKm5jaueNpOw6VMyqK/iUXu2vA+LzZj0QK6/eq7O/RIh/wVa
         L7hSqJTzqt1XVMmH36Eg0XeGGCRMCOD237TWARjqT8tfWWLnKCVfdou/rQYF9R//2/LR
         AEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714745; x=1731319545;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BX28rAzmD4iiFzVyOHBt728GRE15tu8MjCYp4yUF6Zs=;
        b=ggeyHXY1ZKbwI9B7LIhmaxECrfA7aVpq7wu1BWeJd9SmvxGzOWltIn1beuj44cRHuC
         vpXCXU5CsENtZjebjJiObTj4BHVLhym4HrIGxHuC9CFGGkfsEA6IOxlwoO0lRV6huM2y
         U5ey1UK4EGthtIMGU78/BilZqoaIzua0uhnwSYvQ5JuldPTdK1PuEj5I0iK+tqDMI84E
         iq5DSIOAEdqefR20X80YuQJx5aDJXzYRyQuS7v5VkAlb7Dh/ouEXu778KL+aA27EMeVB
         VW1oV/YLMwMonlkHqfG9HF/g4WarXNoAFg5BZuncTj8jlZOt8eMMiga6qL5XgD/bovhD
         LT+Q==
X-Gm-Message-State: AOJu0Yx+rZD3cQujufGz9IUMLhJAM7qFR6ojPBSWpXxxGXnaWDuxVj5J
	ATwOi30q3W04seOVZuIJ8+WqEID3oguF/+qMqK1tJqkhXtsi2ISMboTHwMjr
X-Google-Smtp-Source: AGHT+IGnXTL4E0qg4N5wQnC9qnKBm5ZLwOdaxNYXgQIUc+CvECvaojVDg+vUDIeym9RRFz4LtdMVKA==
X-Received: by 2002:a17:902:ea0e:b0:20d:27f8:d72a with SMTP id d9443c01a7336-210c6cd6531mr417664475ad.61.1730714745557;
        Mon, 04 Nov 2024 02:05:45 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93dac0150sm7192892a91.25.2024.11.04.02.05.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:05:45 -0800 (PST)
From: Debbie Magoffin <parthokhan743@gmail.com>
X-Google-Original-From: Debbie Magoffin <dmagoffin@outlook.com>
Message-ID: <a18ba0c50cbf27bd9882dd906abbd13e64bd5531a65ef15f90b87031cc9c7708@mx.google.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Yamaha Piano !!
Date: Mon, 04 Nov 2024 05:05:35 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020547_120964_52C6822F 
X-CRM114-Status: UNSURE (   4.18  )
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
Reply-To: dmagoffin@outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

I am offering my late husband?s Yamaha piano to anyone who would truly appreciate it. If you or someone you know would be interested in receiving this instrument for free, please do not hesitate to contact me.

Warm regards,
Debbie

