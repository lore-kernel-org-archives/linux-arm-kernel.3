Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCCDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jFhbuFZEV76kB9iHFCA2deOXj1dbKW0OVCEbvuQQzM4=; b=mD8t0Ryc+9dCNyEthd/w0EYEh5
	Ls/eNuUc5or4+fFOOhDCSAcrIOk8XusArWxEV1untIHFqfU4aFhGj4DObjdyydITtgtBilXeZtMRX
	G6/uQv3L0mpByFnt1+vyiqAPqnVR+2qNsZEUm7KTOGcI73dk+9OWinRXqD5TwYjRyeJAKQa/yOJuV
	97tNN21CcF9krraQQ4+U7sfyEKvWkeEGjf5B/krce+OaLFlvIO0EFoG/qSu70dYUg339NSPpj/p2p
	nEjLLCv990hBNgVQNlOXKotgjDgAvBBbIXHxRdSi69uQZVxGYnp3ffAzLRC0Wwes4wb0p7y5t3YiN
	SFFDD65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfwN-0000000CZkv-3XdL;
	Wed, 04 Jun 2025 04:41:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfYp-0000000CXLV-0Agn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 04:17:08 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5534edc6493so3309786e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 21:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749010625; x=1749615425; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jFhbuFZEV76kB9iHFCA2deOXj1dbKW0OVCEbvuQQzM4=;
        b=BzTjHeWuzbQmX2HylLMMFEk88+KhOhzhM1HPhvrXP/9pWmy8od9xlbvAySJ368CI4W
         z+9HkIWZZ2RISGW+UZj6V0PsDnDX+H9yEk+zEQ3vEo2ID9m4HHPE1E10NjKQSGhMH0Q8
         5mVamNnlwNr9ef9avQ4cDfnJ95l2j0cCqG/dbswZVCX66mSlSxHnoaGLPcF0PARf99ZC
         A143jnYW8UdRFxIDIy0yn7KVR7WpIWu7lvRa7+D+YNPtQ6UuUXpa8HLISARZwbK9MHqD
         hrkpcdhe6pLd9xTavS6tYJoljvNs3l1quut3nHdjp5dPm3UIONwtkzs42eCzm565pQPv
         K1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749010625; x=1749615425;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFhbuFZEV76kB9iHFCA2deOXj1dbKW0OVCEbvuQQzM4=;
        b=oWpKhnN8d+YSBfgqdLSLyV2aSgas+508R0T31dkt5oSTf/28Uqsk0eoC0NbPh9uYP6
         lqTKAxjfhjxOkrijPNcKyekeITZn9gF/k3390bvOVgLOC3iBrWqFT4mk6adwPq/QskCa
         Q0yFXcL9cJRV2fE1YJ3NJ8BmX/99NE27snB+DZgLPI6MC/ORjkqEu9Ux7tUc+taJzGa9
         JrHxKBpxGuwEIdaag6WfoyXu3tZwCdtD43+wmkTSQmqC95oW4fn5Cq8J+XRuqph+ZAml
         Eyo5KK6QG6KFT0ozKUT6sYEqxS4yflHUJD0zG5rKNMp9SALWLq8g60mCLbQGmlfroF+S
         rfrg==
X-Gm-Message-State: AOJu0YzPj4FeYIHju1tCVPLc+1tXl05fvYJJ0ZO779nbiNvsFZ28O51r
	G3Zb2dohTlngnA3MV76xT2VVAbv1GQZHyj3N82fiTXs/m7Lvm5sTExJFkr+OIjxS9zyIrmbzb9y
	G65gd8P2JSjONX26bBYdbYQzVI/IXHas=
X-Gm-Gg: ASbGncskE27/y/oNHCJ+Zpgc4V47SmoFNJpjfGpUCI7+Je+qYewQ3X1VfPt53iC+Uy4
	3HlDit7YpwloubD/UOl+JI7vVhXw+yixAtEtyeqX/FAhLo+cobsziYVxEsJE8420p5y0UjT5Mi2
	FUtTT71MmqdP/fiMb3GJNnohzmewffjcqTRsw=
X-Google-Smtp-Source: AGHT+IF8JYcUurqoQVRaGs1znsIUmEcxTMMDwTYEFMllSxwzCtKHMcp9RJ9lMNUkGD4wl+T1v9ONx2pPqZkMAvVA458=
X-Received: by 2002:a05:6512:b10:b0:553:2159:8718 with SMTP id
 2adb3069b0e04-55356dfedefmr335365e87.40.1749010624804; Tue, 03 Jun 2025
 21:17:04 -0700 (PDT)
MIME-Version: 1.0
From: Luka <luka.2016.cs@gmail.com>
Date: Wed, 4 Jun 2025 12:16:53 +0800
X-Gm-Features: AX0GCFvhccyFHKlZbwBTzZB85ZzyFsSf5as1lRKCg-8Sw62j4Daen-A1EwG4Og8
Message-ID: <CALm_T+3nBU3CTxFp6NCO9mU74ZrMFeyyTqUYf-TuUajY8RtLwA@mail.gmail.com>
Subject: [Bug] task hung in ret_from_fork in Linux v6.12
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_211707_075602_7227DCD7 
X-CRM114-Status: GOOD (  10.34  )
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

Dear Kernel Maintainers,

I am writing to report a potential vulnerability identified in the
upstream Linux Kernel version v6.12, corresponding to the following
commit in the mainline repository:

Git Commit:  adc218676eef25575469234709c2d87185ca223a (tag: v6.12)

This issue was discovered during the testing of the Android 16 AOSP
kernel, which is based on Linux kernel version 6.12, specifically from
the AOSP kernel branch:

AOSP kernel branch: android16-6.12
Manifest path: kernel/common.git
Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12

Although this kernel branch is used in Android 16 development, its
base is aligned with the upstream Linux v6.12 release. I observed this
issue while conducting stability and fuzzing tests on the Android 16
platform and identified that the root cause lies in the upstream
codebase.


Bug Location: ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

Bug Report: https://hastebin.com/share/xiyapaboxu.shell

Entire Log: https://hastebin.com/share/kibohuxobi.yaml


Thank you very much for your time and attention. I sincerely apologize
that I am currently unable to provide a reproducer for this issue.
However, I am actively working on reproducing the problem, and I will
make sure to share any findings or reproducing steps with you as soon
as they are available.

I greatly appreciate your efforts in maintaining the Linux kernel and
your attention to this matter.

Best regards,
Luka

