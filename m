Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A5CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NBc764gAPY6I6oAij8+pGrrMrHEcf79TkE2/AX5UIgA=; b=3EP0yG5asXFKEH
	qivktX1l62xjkxp8jaRvn2OVW3R5b7SG5j8F78eKuQs7wM7Xep/VLgm/fPdF1HJKD6q9gQwcPxFPZ
	3gTP4zs8o+h7P4sebsRNduS5AsRPCOpbtyraE67Ag2GWHjBrMfqYtG0c5UYLuimQyYz9kewLJ+ZWk
	GWfVevWDDWpN5vwi043z13H5OXFo26GE/jk5K4qx+SUPpfDQB68lnrtewqekrmI5UnebWgTbLAmxM
	tD8SeiIzqf0wUiSHBm5hOaVPeaq5MeV6zoiIDNXNun7U84Yw7cDYALweKBd1Av+dCc2M3YUEGe9iI
	beBxHW9H8Tboq/E+inoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81SI-0000000F2xv-02Fa;
	Thu, 24 Apr 2025 18:37:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81QQ-0000000F2ap-1IFw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:35:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223fb0f619dso16690745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519753; x=1746124553; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBc764gAPY6I6oAij8+pGrrMrHEcf79TkE2/AX5UIgA=;
        b=H79B6yXkPlyL4pSJVoNG+XsaDCFo/hj9bqCKA7sUkzkyT5zIALlfxSRLiYqUpP6BcQ
         O0SN/Pop9GLW1JFupikF7+NiDSLavl2zoE5S9jBCDUzZDiNULIllq2OKzB2cUA3AmYSA
         kX7dbjgeKAQbOfXWTWjy0NOdFcCS6Y0urhJSp312fONCqfnKIXLGIJxtDQ1IhaPvTaIc
         RT+CPMhICvNtRpJf1dMlIaNfOi3lziGHqyhJ6r+ebLsL5opalqPZLWdrxCeQJiDDJ6JW
         PniCwYgzir6+VZ/PY8UlrzLI549b045PyUZK4Ubf7kZ5GZ1lxjybXngizT1RFFWDrkrS
         c+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519753; x=1746124553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBc764gAPY6I6oAij8+pGrrMrHEcf79TkE2/AX5UIgA=;
        b=QVKEgiRUK1soxXiBuTko/MqAXHex5FKXpUNzl4bKsuJNGClYGo9xeaN5TyH7PAruA/
         zldgd2QSHLIH0yXaPaDxrENMtSoqKsYw2yuvizqjIT8wxeH4GHYSgcsA8hnQBDk6YgYK
         5w6wNOWI/v5oAgh0wUZRkJZMjfQtW5kDTB5bq+TebfoV79PWPI9uoI/LaZwiK/O6781L
         8GHS4xO/jWfe8kb534rQKCSng4SxZMwwOHIebsr3wOLVMNwM6mF6L8Be9EmsQYkmLlCP
         lMvGXKKGRqqY3UFqaKMJ4r9tE/RwHqanNs4wh7hvZuencgd4nfxiALGcUR8GMQlRtsmD
         cCgA==
X-Forwarded-Encrypted: i=1; AJvYcCXpgY/tY3rO1nyjtiXtIejQPyDws8O9VhmO91s7HjZhkJjtdjNPdOVXkxgZp4J5maFAatXzNuciiFcMCazvurwp@lists.infradead.org
X-Gm-Message-State: AOJu0YxpELHhtmgjsn3J0jIkhNam8xHT9UlhACud7w5ckxQ+fR7DnJYF
	nuMiAznx2ytqSMKATTZk7g71W2TA89Frq3ntAc9KE4t20/ZW2Tj/
X-Gm-Gg: ASbGncsYUx9wagFkVn4pwYMPmY+axHe+SemdkUkd5sVAsrhtsWeQG9z6fr4TYBUoMMm
	XIDPQDN7ZSdS2iVWGhNdixU7ah4qnJFVFMnQjCbH+kueoWMFS5Bja08BFzyTSEKKeaegQwRVpw6
	OeHV+q7vA906simLnVu0giafcHRwqJXFOLQBq76OJEsJPv5/ThNZADY+ysf9/i8WbG7cCIi3712
	o3DKjKpb4PMKUBTX/z2tZtuZlSnw9ueBDiG1s44I84scDFCqWmI45Y4ObSSI+mvHAEsSZ7CdgU/
	/s1//+lEw39YFbwMIsSHSzhfaLo4qy9vRQCJLGvWT847BugT/rlZ
X-Google-Smtp-Source: AGHT+IGSak3MroUglM9OJGaj6RDbJwkqMh1opcovTUID/RG97drpXY17L9YbCNB99D0OP9MNtTfw2A==
X-Received: by 2002:a17:90b:270d:b0:2fe:afa7:eaf8 with SMTP id 98e67ed59e1d1-309ed27d219mr5532677a91.13.1745519753252;
        Thu, 24 Apr 2025 11:35:53 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:35:52 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/5] irqchip: vt8500: Cleanups and fixes for the irq-vt8500
 driver
Date: Thu, 24 Apr 2025 22:35:41 +0400
Message-Id: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2ECmgC/x3MQQqAIBBA0avErBswtaiuEi0Gm2o2FmoSRHdPW
 r7F/w9EDsIRxuqBwFmiHL6gqStwO/mNUZZi0Eq3ymqLOfWtUig+ObzOhRJHdKazZBoyHQ1QyjP
 wKvd/neb3/QD0R0jxZQAAAA==
X-Change-ID: 20250424-vt8500-intc-updates-c364a31a36a9
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=1132;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=WzzRwbVxwU4Sg9QhOUPRQ+o57o2byuloGKZZsxSfWSA=;
 b=+hqUgicjwuEpZL3HXzOsh/RoNZKxU+jDbd1zr3Uh/hKjekwV+nwr+AJJSjsYNyvjgTelkhsSU
 sJtPdTkrq1OCsgR10uKQcOeWMBaYDqNYQNKAYlGIBe9JfsiCAHlx5QP
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113554_351877_DC03192C 
X-CRM114-Status: UNSURE (   8.35  )
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

Fix the logic of ack/mask functions to actually do what their semantics
implies instead of lumping both actions into one. Also rework the chained
interrupts handling using common kernel infrastructure, while getting rid
of a boot-time WARN_ON due to a misplaced call to enable_irq.

Apparently neither edge-triggered interrupts nor chained interrupts had
any users, so nobody complained in 15 years.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (5):
      irqchip: vt8500: Split up ack/mask functions
      irqchip: vt8500: Drop redundant copy of the device node pointer
      irqchip: vt8500: Don't require 8 interrupts from a chained controller
      irqchip: vt8500: Use a dedicated chained handler function
      irqchip: vt8500: Use fewer global variables and add error handling

 drivers/irqchip/irq-vt8500.c | 149 +++++++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 69 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250424-vt8500-intc-updates-c364a31a36a9

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


