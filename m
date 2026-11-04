Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C7606D805
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z9fk0esQ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GpCcGZnn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=; b=z9fk0esQjGRjkFxcpF7jDGHrMy
	uKdRDiJNOEC3ExhSynF9C2Z7EvVCrDvHwFH5L7qFdeLuxd9jU3BHINDpFEm1CqqAALD0ZeJOXvfXG
	Y9SUtS4tWQtM4a8XbDWAXs25di3vdjp5Wuj8VIveKSyyjhfH40nWV/9ScMm/gqAWG+YXBNTk801ZU
	E0+fXKzO66aXvZu1GYf8yk93OiWQugfHLtiKpvtz5JryGt7fPhfGgwaR8BQbC0l1pKmMYd0uatFs/
	YC1hDIxnKlQKm0ioUn1jjcp8qahyJ5M+sbR1+3KWfsO7NWaCLoNY4EwOtz9TVoZX2HnylJZiEH7pc
	Myhjm50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg3T-00000006Rbl-1AUo;
	Wed, 04 Nov 2026 18:49:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg3Q-00000006RaW-1Dvz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:49:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b467581b98so7718345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818185; x=1794422985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=GpCcGZnnp/UkwfKEfygUGiWwTnNmJbIv2i873lBh8j23XdTq5hdvB8AeBB8b3bogVN
         XRHtN2DeJcZ0ByGlxzqIIP4lNXV1DK+czIFCXQGX7x04wmyEywZrcMh9w5N47gx7iO23
         xVapy3Se51NkpA1wpTJ8roQi1H7wPm0epvrED8KIhLuRZd/y7f/tH57o5Fdf/Qbqypo4
         /Kppc2RSvVHULHF32EBARBIx0TQopPivLlBsqg+AxvohKQOV05s6i+xWECTpOof7FM6K
         TNFAduxudTAXboyTPhjP2AaplDURPd0cr6J/WbN7kpI0yv7tXgX3dFgU53LrhwgbsWMM
         7pJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818185; x=1794422985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDX9nGWyIBZYspDuB9K3KPW8x4O1lO65MXioXZW/+9U=;
        b=X8989UIdMIyA3E8d9ErsRxG8QTAekqE4ZyCCoxS2udcw9Eu3/aPM4mt82SPivmDCZ9
         lFJhjqd6OewOS1+3ABp1UrTA59FHH+p2re3BRR2NFwGiA20QY9duolcVVTdWeT8OGLUB
         9jWE5oOhSnfUFdqIgqX8WfD/ytJQCJmGMQNZLu2ZAAfXxpwP0V7Ww8ZSxcdadGpoeM52
         SOTXHkk1vvKn+yl2cUhexRM5anBr1X2fjGbf2a+6ZCx0cajFN70DZgy9B/mzXgpJhcIU
         Yldg8YSz3pn+MuT4LC4NVR9Ez9moftmsWhYnfv53F5GDawPmM/evvD2//0qVFpVUwFSX
         Tqgg==
X-Forwarded-Encrypted: i=1; AKwUvBymezzcjNNayG3SB0QsvEpYUMacS+kA6xhXHD64NBvqt3SdWqFLJmAWLgJyioRtXqLiTmB4g2brc+wC06GmeN5n@lists.infradead.org
X-Gm-Message-State: APuU4Z/VKtwLUhKQvSbapPyNQklAdALy6YC6N4+tkaNGvOjRwwAtnN5A
	GLTH4bDn/A9dvL3rwF0FuFFGq51F0qi7VPXtcVOutdRvvcOTX80GZL4I
X-Gm-Gg: AYBFou1hCMNGX2SphL3Wtnhe4dJFdWZ5gCd5OzyaPlYaw4tSprIDNeMCJIloGf2NfFi
	h7k+ZNfA1NFCxS6OJRHctH8Vuk7bfkj7uWq5Al/2U6/FKmTZbf9Bq6eKr8ElQ+Dn01RLNcTz7e7
	recuk4mPRtl9DcNoB96maJtEMAQkfMaPwduSnH/RMvhmqhbtwzWNJLiKIVTqJ+CqrM6Vusi0kM5
	xxg9lWv/q/MOkZPDzaqqhdp1IBf6iRDkTMwbVty8rQejAe/YNShwSJrtU+l4TwYMfOjCznENUJV
	HypN+amZi//ilHCcqMj/ugopkhN4hbZKLRQxK8uEuKozAG00ZD36Cg4x4OCChZd4AWqIunOGsTk
	HD6bgo59cNO7p5GPqPH+mmDkgyhmrrVlNTLiMOWbtsvhvQ0uky606BsDfuHRKR2KF3GKwSoFYxc
	Hj+XgKX+0iKipQW0GRZvzVUcj1by/C5cDeM18jDWJ0fifxOGnW97EIlwfqeW0HQoxVws+ZaMnXu
	Xx2Ygp71jD6TwFJIkcP4ZutlYg5sO2wGgdS3jT1dPgu3VTb1U3NPiGwR6lQZ5Qzk5eni6iKvB1x
	sZEbEx5pUzvG0m0+A8xhcmH7iu/XOpyqWAsBf/luWC3DG+lFMDDtRH9z01X972G3lN7SraViIsu
	hWHFT1NdsL0RNsM7urv92aLgCwG8e/c2nfjbYBtrg9QmFsCVqP/BgvnLEt/X7SkZPOFyQVZpWao
	IxG0DfjiWyYL7RH6RoPscwPeGd6RjpPPKCUHaRcw7tIsfUZUeAUzN5tNxpSVuv43oF3oiSPvYIi
	95leTtmCc0Gkgyb4prPYHo4jdkepidXxSUbvD3+gwl2
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr403830775e9.2.1793818185436;
        Wed, 04 Nov 2026 10:49:45 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm5081745e9.14.2026.11.04.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:49:44 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Wed,  4 Nov 2026 19:49:38 +0100
Message-ID: <20261104184940.882833-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_104948_358879_985034F4 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Jernej Skrabec (2):
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 6 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 9 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


