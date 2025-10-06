Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2573FCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XbkOLsSeEc4de19QVHiox7c6UUo78PKyegeBXplGkhg=; b=EKLIGE+K5bYwWjDVHrj+o9UZx1
	2tQyAqK22QwMiZ3XcuKGD+awO5QaoegmRnkY7ImRLn1wI1ZJB9AYyh7squpCKHZnS59mYVpjvaew6
	zD6U8MtIu8DnBr9nvHMzoph0YAGdVLFiO0DFBthUWeR+F3q4FjSyQZHqZ48HxxUjfggOWTUG6fWw9
	iUn4F3wuZl9pbzAo13BbA2nFpEA6MiJ6thw2PNHWxisdEyvGUyjBnrp3jcRc5jDoe8rEtWtdh0+ve
	xT1yDy7P5TFU7eX3OQV36ieAjD7OSGpOfse6REgL7nbPV0tCjjzZDAexwl9LMyDGksKlZkKBrTXJU
	y8mEDjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5gok-0000000HCMW-1kpz;
	Mon, 06 Oct 2025 08:43:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5goh-0000000HCMC-2pW1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 08:43:37 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so65869675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759740214; x=1760345014; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XbkOLsSeEc4de19QVHiox7c6UUo78PKyegeBXplGkhg=;
        b=ej/KHHFHTg5ccYKUIAVmXWFgdeCrMb/VMr22xJVrZSn5XBgZPdHyrt1VkId2o+VoOx
         ZlZwwYuCOT5V4i7nxcMiB0WRNQA07YhYDXC4P+veroRHruMIa+q6PEDw1PwVebK6oCS7
         mzxDGQhk6AuKheWMcx9PFpQDstC3KCyRmSAqbuYPZUQo19AaRjZGPpmN8rFi26/+7yeK
         BHgyFC9aco3ZaxrmKaxMJVngIfbmnolvB2eFdY0FzjlwWWeeFC5u7QKLt/owejKCPPkG
         PJ7RlERfyELuLkR2oGpZuaU407mgZPQyodiGJrHD2cszrrmPbwH/dutTkRWZoSixdBua
         O3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759740214; x=1760345014;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbkOLsSeEc4de19QVHiox7c6UUo78PKyegeBXplGkhg=;
        b=BaQPgzGqyS2ImbmkihTujwFTuR8L/4kp2/0qjtNwhyjMN9RZA8ELuE0d6IgxkSUgpp
         j1HdKk5WCBvMHGoFcJiEt6JBJlyFGsyeedEaWug3eRfCSRN1kbmAzlkmLreW9JRDoUqL
         MF5ZMVEAawtZCUAn9gwVrutY+5jtArhO43hTbKeJAR5AIJZ1pLRlzC6fS3fC+9jVRLiH
         WoKmTNURH1pSUmB75+8jbU9OTFBbVMQrPiVNeLnIMqc5Cn6wuPkGJUzpg9TNmX4qGwhT
         b7ufos/PoPzVx+F4jn4sMtAVzNF3rI7B4Qtg4x/fUQRLcbqxOXsEELj/JQRiWI2jm0pK
         yAZg==
X-Forwarded-Encrypted: i=1; AJvYcCXNSmD/Alqh9vRJKHBjdDjWb4FCDs934egodykchvsEEpFbWi+qHy3KuV0ay5vYp0v1/l09vqFFxZXuen5i8em7@lists.infradead.org
X-Gm-Message-State: AOJu0YywPQPkihbpkiFtmq/KTCo10aEzOGnUp/R5t911xubRJwXOljWR
	1y/L1yE5OGBzYqBWJlTxmNEcoVj08tvnljm+3vqh+U1kyfS2OgabCzUAkNhQ7RKcP0kKE3tHV9j
	8KpICJ99fXOPYTa3IEX9INAElQB5pvMf4res1m8CdXw==
X-Gm-Gg: ASbGncsbl17lEvDDhlNIzLnZ9pPgCk2Gy/MgGb5MFZPjlPJs8rFVlrH3FfpflEHM/Ur
	WDBp7GNFeVaQpA6ygYXILjkHmJqH3J29PrnkiYa95mMC7BxvnFcqksPbL53hcd50otrJAuzzp7H
	AK45f1TZOjNLAh75yIKTDTcYa32jjmuV+/E4MoEPjdJeaCPq3LhAD3gETqEPROG/qrn5o/igNC3
	nuq3qONBRyTU5xM9FT5VYdoy2iZcNTZyjTHEpeUq/jQ7VHQgNnermpJ/G4GBYkPkY/HYYdVyBtB
	KQVx+iDT4vEZ/JA+bNJT+InlqDzhrb44dfviBYyPxcZOEg==
X-Google-Smtp-Source: AGHT+IG70fTPRSenFkY+h0Ci4bsOWclGRtd5+NQm5QtlMXDZUWAfWyV7v3HpmAz+QpEftxA1fNt3+ZAYzqOOG5usHHU=
X-Received: by 2002:a17:903:2f4c:b0:27e:d4a8:56ad with SMTP id
 d9443c01a7336-28e9a6a2eb6mr138892325ad.61.1759740213842; Mon, 06 Oct 2025
 01:43:33 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 14:13:22 +0530
X-Gm-Features: AS18NWA6yLhMUIQR5RWLa0LAv-ggCbP2Rb4RY4ONcT6ZxSvFVMy57u3jDGKEbJ4
Message-ID: <CA+G9fYsZvF1f25x10oL=Gs=+f_AFmaUFtUT8Qs1bXugEaJeoMA@mail.gmail.com>
Subject: next-20250102: arm64: gcc-8-defconfig: Assembler messages: Error:
 unknown architectural extension `simd;'
To: linux-rdma@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Patrisious Haddad <phaddad@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_014335_719466_23DB44C9 
X-CRM114-Status: UNSURE (   5.12  )
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

The arm64 defconfig builds failed on the Linux next-20251002 tag build due
to following build warnings / errors with gcc-8 toolchain.

* arm64, build
  - gcc-8-defconfig

First seen on next-20251002
Good: next-20250929
Bad: next-20251002..next-20251003

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20250102: arm64: gcc-8-defconfig: Assembler
messages: Error: unknown architectural extension `simd;'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

### Build error log
/tmp/cclfMnj9.s: Assembler messages:
/tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
make[8]: *** [scripts/Makefile.build:287:
drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1

Suspecting commit,
$ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
         (".arch_extension simd;\n\t"
fd8c8216648cd net/mlx5: Improve write-combining test reliability for
ARM64 Grace CPUs

## Source
* Kernel version: 6.17.0
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
* Architectures: arm64
* Toolchains: gcc-8
* Kconfigs: defconfig

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/build.log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/config

--
Linaro LKFT

