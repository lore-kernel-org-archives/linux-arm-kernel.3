Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F497C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 01:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fh3hbfAPnUv9G1YI9juHyYX03wA62ePqU142wDCL6b8=; b=b7MGs/9L/NLY6QQ3ZKZF3fNUdw
	SCYdndqthNGAyGR4I+VKt9wahPPT/AmhWwUUJ+jGzGd7gLFMuTYbFsSY+gdWoRkCNCAw3SZ1zyn2l
	wbaSq1JedDi5MSYmIiEV8z9BghaPy2FnqPBADh00pJ4Q6MATiZCMt8THunqx1z1tImJdZA9DzT7h5
	DSOZlY0UP6g80rEyhqm0hX2qwqkFct5f1SsEaCIvdWgFxOrcR6+EDwPRmqVGxLpnKqNb+1slpQ8IE
	UFkPbVXChR5qwPLnlQti08U+ozhGToTsBM20fTOkjk5mTbMTZFqyOUrnJ+X6oiwpkaWf4ZhflKL6/
	hYTIVFww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umNBk-0000000FXfZ-084q;
	Thu, 14 Aug 2025 01:55:32 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umMkC-0000000FUUJ-2ujk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 01:27:05 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3e57376f644so942095ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 18:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755134823; x=1755739623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh3hbfAPnUv9G1YI9juHyYX03wA62ePqU142wDCL6b8=;
        b=UMUuPSUi6dhsgs2msEypaiyhRlN5TcmulNzeTigUUU4hQQoI+QXwngwYeNRm9gdFuc
         Ta61n5pFHcCLGm9ChDBz6cxj73FvrlbGi2wpe6dJGR8r9IRFoR0cWwsiSVcdkFXzPq1V
         kDx/qgIHW7PLGDON10f18UdiQpqeQbyv/pXWSAfrgam7qoGk2kHhdgYXNva8xbBOGGcF
         +md8q6EnOD8PXjjCfu7Nix6mIdvuKf0vua8wNLN2F0Wju7Z6IDDPGaqKk07rVfNfb3YE
         G6dILahbt8qVkc5puIGbqDxDgDHTZi3ahnuSvZQau9Y8n6Accl0nR0phxtYNVjXHGLVm
         4orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755134823; x=1755739623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fh3hbfAPnUv9G1YI9juHyYX03wA62ePqU142wDCL6b8=;
        b=SpX9pg3h5avJ9C+ojg7qjMhtj0/WFgsOzIiruayUilalBlPgQis3l9ZTjqwHRlrpdd
         EbyxuVAvwmeorqdDDRwBRvee8nQnV7szi3kGCGxd6RrNFgGo76F0F1KK407YYCPyemuP
         V8wFKMT9G6WGnqcQqZ3CzNTWzwxjjqbcvUeUqotnH/8hPPEmJKVYiWpjLuACInxqXciT
         i3SzS0iwKq7j9231BgxO5l62ehvTO58It53jaPZKEc7CSEO1xg1u29jMv2hPE2b6GmxN
         UZ9c5K02EChHg+76em+bYgthqQk64Nci4wU3y1LcZNyEHeaNz0lOn/ScMWYW1nf7jPYu
         cTsg==
X-Forwarded-Encrypted: i=1; AJvYcCVd2Y+LkgCbKxxtOBhCdG20IeNfLEDYBh3ICBQtTIB+ooifoZWO1/qVmXSqmQF8IoA06UuJRcdkPsN2j+bMhDp+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyao0apoYV9/4kmQtW4l1C4xr3h83Nl/gnSdFo15WN+BT1vzIU2
	O9v3NjrHb/MsNwQLK0OYp3gGKituAxVCWqyIlC59fF6FMIMBtTPwZXlA
X-Gm-Gg: ASbGncvdLJYQRTPqP55Ub9ZkoMsyOT3n96RvffstX9lCyZXl151CoX4fu/DtBjGG3L3
	AxK9xjhiFACcvce4Y+CkP4/7mkAlgzMxRUfkG5EGilpIuO/ZvrkC80uvvkrmaGfRniKrnxg4aDy
	M/avsrTpH07M1LzoNUSLd15TspFIwZsi0TjlhVlkMv220wEDJQYGEGMphUOQnyfaqnhO8+qsuXh
	aztxq6EI+lh5KC26j2HMf3Q9u1DqrMWWnlBtMEIz6j/JQLk1z4uI9OJxTwAFY/uaWVRqvob2nfA
	/wrG4ooayzZ3DxpQGjPrDYm0mG3CnD2OOYjQnnJdNttaNBsKK6yLkNeTLf+7kEbLxuPXxz6AfL8
	QIXhmKlZy/qs0nfHnnYbevqh6E/ddH9MZ6MzCCqDmv64p0yB1SS6AuX/F4ZPGBBJWPuU=
X-Google-Smtp-Source: AGHT+IFk4rAezJrZ8KB37l+E0BRHoncpAw9qNT9ZlZVyNknBnDU49aSvpBLehQo7DzJZcha8fc2zmw==
X-Received: by 2002:a92:ca45:0:b0:3e5:261c:bac0 with SMTP id e9e14a558f8ab-3e5709a85d6mr21296165ab.22.1755134823462;
        Wed, 13 Aug 2025 18:27:03 -0700 (PDT)
Received: from localhost.localdomain (65-128-248-47.mpls.qwest.net. [65.128.248.47])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae99ce764sm4044087173.28.2025.08.13.18.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 18:27:03 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: Shimrra Shai <shimrrashai@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] ASoC: es8323: Playback enablement for Firefly ITX-3588J and similar hardware
Date: Wed, 13 Aug 2025 20:26:49 -0500
Message-ID: <20250814012652.81424-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_182704_733245_F22B3091 
X-CRM114-Status: GOOD (  10.87  )
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

This small pair of patches is needed to enable the audio output to
speaker using the ES8323 CODEC on boards like the Firefly ITX-3588J
that use the right-hand DAC mixer to connect the line out jack. I also
enable associated DAPM power widgets so that the volume can be
controlled in the ALSA mixer. This seems sufficient to me to produce
basic audio functionality on this board and any others that might use
the same features. I tested it with both ear buds and a pair of
speakers plugged into the green jack on the back of the board.

Shimrra Shai (2):
  ASoC: es8323: enable right-hand DAC-mixer connection on ES8323
  ASoC: es8323: enable DAPM power widgets for playback DAC and output

 sound/soc/codecs/es8323.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
2.48.1


