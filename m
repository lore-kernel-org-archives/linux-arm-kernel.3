Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A562C36002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 01:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ib9+Q0ada4H11TeWZKVSJ40rZdGKNeCFH54Ppv1IWfU=; b=smKk9cO7O36D3q0MbbacRMZGYH
	ji6k3U1HO1ENMdxDaavD5WbfH16W5j1HiC/GUZ6uUB9hJk+qGNZ42yq3C0ygdVb5mtPu4OBrVXmij
	cALpn67gxoCGH9n2CM45LxtZI8ItgeQQtMuUD8ZQddHdQRSfLhOxfsza5UTEium71JyWrZ1j1YWQ9
	zTFo5BKtgdAAwfmeALQPtM9LnJP0Yz/yHvJYZbolCgRbrCKoE1Sq1rwphWHe9ibppYZrkhttFR4yV
	LGVPsLSYnknRbX7V53IY31andrP3uAvXFE139hvi52zaxgrFFQXLH/0nkXiGJG6z0bsGtOjKGYgmp
	65JCpxAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twtYQ-00000004e8W-162x;
	Tue, 25 Mar 2025 01:58:10 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twtWh-00000004do4-2EOX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 01:56:24 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-2c6efde9f1dso3661873fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 18:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742867782; x=1743472582; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ib9+Q0ada4H11TeWZKVSJ40rZdGKNeCFH54Ppv1IWfU=;
        b=XkyYtBnJBDHQ2Jh796DikfRcHtTeOf+E80nBAgO9sdihYiB3rKAlzhiU/Ei9G8JoI7
         6kHUmzly5mKYHzcC3UFzivTwVmrMzEGaYxIg5s2SPxktm4jRUX7J/pKQtKu1OQTo2HYl
         s//WJT52IRiMVkU+AdX+CvE+oYgy8JVVYSZVowvpTJ9LKa7Kmc437E43fjNm+N/T5KCJ
         Njsmwf5XzWDWxg1ny/PvKNwv7m9IYR0KmUrFNzBBq7VwSv4ATfwUXQx8c0HA6T5mapsP
         SIIC4FoFYVxfO4pM6stN/nIegZGAY57Xcjc8Zj27ozLOicXcrOsjHQsoBUT/TWeEGDvI
         ubPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742867782; x=1743472582;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib9+Q0ada4H11TeWZKVSJ40rZdGKNeCFH54Ppv1IWfU=;
        b=jCZuOaN4duSi+VNobQmIjooE1LsjEUHrlOB5oTOhuGERZBNwsAc+QSjgBUbLmB/eX3
         ipDM8IdM6ERGDYqXk9y2f/oiqW1q8prgGU0MCOAMFrd61PgBFGUm/125Q7fFVv5pOAuV
         CMZBsJ3dm/LVA6YIoAPZv56fN4nRdXs/Qk6ioCSyhkuNZmJHsmrIn3KGOvRO1vrDQanU
         Qi5Dw35iSISsHjE64fcUv0gYeId8R6Dm62CF3NfAKSah2gavl6GigwUaHM2RGfOucUBl
         XBvgU9FNrQ4lg1V1N07n7I76IqlZbqeH3nJ8VbmlLdn8BUbyNdxVBcvnONFMbbBD/scl
         AABQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzrOEEqN1XFtz8vqJAM2NzUDK5MwefoUQYJt5KUSYY+TQf05UObeXFMTj9HBECCNAmBLvCtZpIYDq45YHHbwVL@lists.infradead.org
X-Gm-Message-State: AOJu0YzAJEtWurO3CVRF7DVZkkUFAdZhXqnbY95qlZrM4U33diODrCq1
	yMnSg8j6i0qbtR4Xp6CG4sobGVz3Gvc8ObYSntMye0PHUpIHwXFtDVU8y9gVSZW2aw==
X-Google-Smtp-Source: AGHT+IG0+uLGPYG9slyIicgnfJMvJ/fL3LCjzaIbzQaDguDS59/5o4ooegKCdV6c7y6nONpb9SxgUdw=
X-Received: from oacpc8.prod.google.com ([2002:a05:6871:7a08:b0:2b8:faad:4f1d])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:e496:b0:2bc:7d6f:fa85
 with SMTP id 586e51a60fabf-2c780298b2amr9783186fac.16.1742867782106; Mon, 24
 Mar 2025 18:56:22 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:56:13 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250325015617.23455-1-pcc@google.com>
Subject: [PATCH v3 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_185623_598919_107721E7 
X-CRM114-Status: UNSURE (   9.66  )
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

This series fixes an issue where strscpy() would sometimes trigger
a false positive KASAN report with MTE.

v3:
- simplify test case

Peter Collingbourne (1):
  string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
  kasan: Add strscpy() test to trigger tag fault on arm64

 lib/string.c            | 13 ++++++++++---
 mm/kasan/kasan_test_c.c | 13 +++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.49.0.395.g12beb8f557-goog


