Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EE2CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XSQZ+zE7OvBYItJ+fT1jHCTZEPNcigVOgdTtn6IgEE=; b=R8oxT7BvqS3ts+PcwfT+3+Gx6H
	769JmjLyU7SJNeHs4fHUoOb5lZmXQDJIhcBmCkCFqKFWEnDAYDq5F/y9erDGCCv9pJxnwLgL/q1SK
	zaKSZ5a+5XBlhf444n4xDtc+03obr8znteJ7m+kn7n2cXJD4468iEsjSZ6DtwZ75Z4LHnHu2bmlAF
	Pfrpd0NaPinwixptLJkJLh0qCCxnXaFYZhX8oYeaMZG0Tu2D4ZA1C+aklmbuvXozmmBFDVON5zyw5
	yoxbBTWzeoOzKUsBlRMfJXxrFoqva9q8ah9x/rPJLu1qU9nwLLeF3p72f3YyNafnF46jLUn5B9gKZ
	+alPSPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmkP-00000009SHX-1epE;
	Sat, 09 May 2026 18:49:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmkN-00000009SH1-3V6u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 18:49:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso2144685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778352593; x=1778957393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XSQZ+zE7OvBYItJ+fT1jHCTZEPNcigVOgdTtn6IgEE=;
        b=p4GcRppnVSczs8GSa2H1XxQWTMZaxPJ7y4zbGQZIFJmzdQc/dXZ41SNw57OUR5SQC5
         MrTCbXELBX/QJ3wtd/gUUai9GGjcC8KhfjoIswLTq0PVxSWYEh3FzzIQJRAdT4zDQnuQ
         CDkLTokva4MXP9PRLcDxoPjmQniqxoinsR33jlhKS/ruuUazR8T4bQvJcRwxXerwk0Vf
         TWSvOia52qq0RyUjcKlk1Z4N5unuHRfuC8Qrwjv4GkTctAvZ2ospJlwoY8PNFQAEYuon
         yuqDy8a1IzVGt1XEv5PyDWxuTJF7NLF94q99somg11Jy83nNaKJ1kSbCEYCcHxWaQp/u
         hVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778352593; x=1778957393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XSQZ+zE7OvBYItJ+fT1jHCTZEPNcigVOgdTtn6IgEE=;
        b=ox4AgoMRWMAPmEpNNi9uHFCeKmYgJC/bOmpxua1Mk0WRBIcwjqlnbR8uKy39Qi0lSP
         jCvOOlHMDm9/jziF4vTG5v33hzphWiIXJqQbZrddMWCUk3TSQ1Cvu4BRZTou/BzfaQj1
         lSjKEREVnJc0FnB0axmGeyPWFcj5W6FGm3qdATjBXRiWOcU4tzkgXJWTnVgVG5pfW4ZA
         V/4AL+rvIB1HraS4FBlyfoXtQwkjXeB3E5SVbyym9H71SVwjQLWV9Frgh12NySLsKq3p
         D2y2d0hz16vjKVG6Da4eY4Vx85vWom7snVVKRaFl4vP0f98hPSvgfjMQrsZn9Grgf67A
         oRCA==
X-Forwarded-Encrypted: i=1; AFNElJ82pcg6m0gg323QtsnVujv2RJWDM5INrx/MuoVuV3PSHLMCxCPDTRhqUnccUJkPeambW6+VmPSvAtcYPLn/NyfL@lists.infradead.org
X-Gm-Message-State: AOJu0YzJNEbWHcFA8llIn+L9jDnY9ORXn8nSghioYH/1Xyr4Ec/NVbU7
	UZJ4taFJKsR07wsjXQKjyysuGROsOYdZqrcUPMfQLJ9GRopzsNzLCwkb
X-Gm-Gg: Acq92OGEFB64ZFni4Lrb6G5hoBvWyNN90gqdWsNZAQcx/Q2jLlhkCSq2UoJgz5C6hGQ
	GtqqRgPl1unRj4q7bCtvjzjRTV1XicgrVBnAYRAPyrpQ2E51wKDPHrRNxZ9Qc7eOZ1HDAyYanjx
	Vdy8LhK7ltIBwDRkH+Yh7+rVFiGGCuQf/Tt/sJmpkp7unymP5kCCluxiLI0ZSUpuowki2nz9ir6
	aYR7kCmWmT9lDh4UMAcyHZVAF/3GkBfN6YI5FVJp5VsBzjlAhq6X11mraTgsZEcrlOk690loBWR
	MWvnYe6mnGkAY7y52WibD9a/s7UbXUL66+307URxGzeJDqs0/HhVl79Muk0+P/K/cdH44EqRUFS
	uJh2ixHZKUrFs2pusqs+8jtZ+l6h56CS3bijyivt5dKmX7N7qKgrDIJDtDSRsDEGV6dgKE6+4Ki
	Aun3YOiN+zlYF9Ow2Vx5A/XuajHd+O7bRXLK7AmNYKmLyx
X-Received: by 2002:a05:600c:4f82:b0:489:1dc6:d6e with SMTP id 5b1f17b1804b1-48e5325025fmr130325175e9.1.1778352592718;
        Sat, 09 May 2026 11:49:52 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e5630sm60853005e9.8.2026.05.09.11.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:49:52 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: nm@ti.com
Cc: sboyd@kernel.org,
	mturquette@baylibre.com,
	afd@ti.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: Re: [PATCH] clk: keystone: sci-clk: fix application of sizeof to pointer
Date: Sat,  9 May 2026 16:34:25 +0500
Message-Id: <20260509113425.25402-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260508152321.3683799-1-nm@ti.com>
References: <20260508152321.3683799-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_114955_973666_C5E31802 
X-CRM114-Status: UNSURE (   8.30  )
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

In sci_clk_get(), 'clk' is declared as 'struct sci_clk **', so
sizeof(clk) is sizeof(struct sci_clk **) which is the size of a
pointer rather than the size of an array element. provider->clocks
is an array of 'struct sci_clk *', so the canonical size argument
to bsearch() is sizeof(*clk) (i.e. sizeof(struct sci_clk *)).

The two values are equal on every supported architecture, so this
is correctness/idiom, not a runtime fix, but the new form matches
the rest of the bsearch() callers in the tree and silences the
Coccinelle warning the script flagged.

Reviewed-by: Stepan Ionichev <sozdayvek@gmail.com>

Stepan

