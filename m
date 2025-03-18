Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F50C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UnIVkMBpPNHpHkzRiOFkBTXk7lARMRWDLlaFgNuX0xs=; b=g4rmJOQn0sHQYchwOs6wW0O+i+
	OQuwrAZm5J4A1utuLIGHbz0LNECvNMzHJLuVIM8VSmA0jqDUxA06uk28Vclc9WJCke4nG4Qd6qGAR
	WpD4PXSFeYS5nnyY7/q5kk7LOyvXnKrSoZwywLOAYkNwSmIJ+XNvYwtwaGmF4sI7xwvATUw55+91k
	BUirako1Rx4WJla/Pqh2yTAFYK8/prtGgZVB5CS4Ssv0VDVn4B1rOzky1UK3V2fe6nS19UCpTMRop
	3as7lpzBCbm5WgbhW3dsRWhMVdx3BLubjElvG0IClmwtNIrjKcYh24XGuON5mIddzY9sdDjDoMXAj
	n9lWhwIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tueiU-000000079Ox-2Cpp;
	Tue, 18 Mar 2025 21:43:18 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuegn-0000000790A-01zp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 21:41:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso10143791a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742334091; x=1742938891; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UnIVkMBpPNHpHkzRiOFkBTXk7lARMRWDLlaFgNuX0xs=;
        b=qRqqsqhCwlBLkUWr4bNForePYwnWcYKLPDrScbZKpP52+hO1uCTBPWsDSubriLzi1L
         p/4IioOY8ew6vJnz9bl5/H+oCTOVQi4u/pjpQFh/Klh7il00YUZyVqtfshji01juEi+o
         tXHJbfmUPbHB3UVmZQI6aVSsYfIT+TmRc10lkceTpSSjZA1m29zZh48SWiSdw6nuVbs6
         sN1SFOY45cXcAkiRkS4j57mzsKhmafW5upBJRu/MmGKGn7eD4JSqpsVuvv9uYwqMnrWD
         W6kDU7za9Mz88u77HRFj9FyiJZJ5PwYh1IzYYN+GiGIvM/vK4LXaPsbjZg8BoGysN4+Y
         ZMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334091; x=1742938891;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnIVkMBpPNHpHkzRiOFkBTXk7lARMRWDLlaFgNuX0xs=;
        b=W/TMKjyCvy8XLwWqZd14x1eUvPhk6Io5XQ32tY5YQWZMOEeESVp/af1zWD6EXDlD2d
         i6K+lc7D7k+iuz+Xthcu84Lz4PCMdeejfB5e2iJdPcsBOXW2FPDcES8eR72zYKpaE0Rf
         mWVUbSAad3pYf0g3LvTgKKCqcH9TyYFNAF1kuq6LSfWPm3GnMMGlPic2mA5uYDNQYHFu
         UhE6IfvSV8DqM25m4lgfipLqeqiBsIMfwHQx+TL1jWHedqBYJrsuCHxhu1H3Elgqp+th
         BWQLieXUxmOyjEwyYKBZGfVyLF95IkssFch3HpeW7VNSAo7772sjjaeHeETrrLcyLuzy
         fLFg==
X-Forwarded-Encrypted: i=1; AJvYcCX6FFBrdeOwU5PfI/vJJjJHKxJrRUbYXB1CgohOfDF1GzgRCMVE2LIl4CQCEXc9fjbMrKJCc0DnRmN+U0wk7lYs@lists.infradead.org
X-Gm-Message-State: AOJu0YxVVBXJP1uE5cLbMP8kmMJeH4dWodI8y5ZOlJ5d1kfVoIk52WAQ
	wh6OUtE0sV/klxip742r4oKjwupp3JpVa0PS8LHlEZWRt6qT+xrDss9HfPRBKi86zA==
X-Google-Smtp-Source: AGHT+IH5g0RwWRqxELrdXfaTvTVYsLQLg1QItq6jladHXzNeggEyGQsVp5rE0/DCSbV4ptgpJfGrPOk=
X-Received: from pjbsc2.prod.google.com ([2002:a17:90b:5102:b0:2ff:611c:bae8])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b4b:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-301bdf714e4mr366009a91.17.1742334091291; Tue, 18
 Mar 2025 14:41:31 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:40:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250318214035.481950-1-pcc@google.com>
Subject: [PATCH v2 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
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
X-CRM114-CacheID: sfid-20250318_144133_045143_C7D3F2A6 
X-CRM114-Status: UNSURE (   9.06  )
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

Peter Collingbourne (1):
  string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
  kasan: Add strscpy() test to trigger tag fault on arm64

 lib/string.c            | 13 ++++++++++---
 mm/kasan/kasan_test_c.c | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.49.0.395.g12beb8f557-goog


