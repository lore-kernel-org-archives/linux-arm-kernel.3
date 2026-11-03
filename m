Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MjlTDDEF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6k6g9ux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=; b=MjlTDDEFT5acaa7qk78wRkTC5V
	jRA8M2oPVM6/FDS+J9gYOxyR66YXc6c6Xh8JNNuZozfAbKAQwfzQcN/ZdrXFy8dp8E/HePH5v6bfP
	7fmk4JY4BsxFltiG9+nlIvKn/F+bcI73Ynlgo6TsooZFTeSJVX/j9E/UH4z+Rl3A0ceLeHT9HYRBy
	amtHbN2zrjh1dY1vTC1BWfIYTQkscRtkGeTi3qLZvGUAsca9+lRoBQC+zQZiCF0KMznPH8MD2NmSv
	aUJ1t9ffpPf6R1v1ScttX8ktBWqMAYFgbU8VTaE0gN2TXVsbup1H0IPTqNTi70HpgjsFJsxSUr2QH
	AoVe0+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6QX-000000014nm-2buu;
	Tue, 03 Nov 2026 04:47:17 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6QU-000000014ms-3jxH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:47:16 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-3514b90bb89so7794372eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681233; x=1794286033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
        b=u6k6g9uxLL517c2hudQaByrA930ah29hIj6MqRYE6PzMWPztufnjxDKhEquSaFpH31
         6iuZKw9Z5OniXksCTIUnBoiWMq1+osrp2HSaKl2MI+67lYQNZAhrc81aIv97aNwoEavu
         41724pZrWhsBBQeVUkIp74OHD2n11vnmZDaNoWj5pF+5vll4wx3grd40lGX0NdLxfMwG
         paqrUKYYYSnhQgYyeyOI0fR70TVwYmeZXNsWzP5narK8gyekeZrrvh/Em9TmRGGfPtkG
         dsf4E3ZU6Mh+89pgiBdQ2lRISeFePCq4Tr6RQ5pNhaQdK5rntQaHHjUyfbm9TSPlQqvC
         J7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681233; x=1794286033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TcyaLHkkCUFFThAgS7XPoF0D4DJks2eSDppGrJXvVV8=;
        b=ge+9945FJNmyNMDshZbnWZj578uyMTqNuIOHIUl9eRmUBnI7A9WCgT72PiIXKSh0Rm
         iZ1Tg66zkfxWSb9kW+49iRs0qdvEmQrIw1jQAeIGwqx7aB3lH7ED8m93UMpOpuHBtVQz
         5FPKeqHSt4HGTfV7tJFOE94h/BNuQ/3lJ2zicgc3Vfh2rvgZ1ZqpFqOQmNG7yYSp0zpi
         leDy10DBheqCynt823B88d3AnA7utbccrzBubjkUlwUCYgg3JbQh7jEpC0oLYNwUkW+B
         DRhdubTG9LrjqWaSjmDZcgh9fS6J5RPYd/kRkHq3Vb5mNPEYI9B9k/MzhJ2LA4ngYMum
         rlQw==
X-Forwarded-Encrypted: i=1; AKwUvBxCttOgway/KupkQmXxeR9mk+Mw+2sss+fGOvMT3SSmtCaSUTBoKm6oBJSRkHS8Xr0bBUMzEw7QIrarScAXgZkl@lists.infradead.org
X-Gm-Message-State: AFq9FYJwSGmCVkLaHyfqHR1q0X3jPSkFgjd3SU2imcq4KuB4if1PyK+Q
	Qx4sivLNjqWRx+a34AfMsMsQekPMMv2SCmPF7JTF+2eH9veWEHGLHdUu
X-Gm-Gg: AYBFou1EMODsny8iCk8NyrwYvReAm9650Z0XZMyb0ILp/yA2zBK0X5/AuuHjR5ahd2p
	eem5CEF6yCWj175TzJ/YqvbpWwZNTwoovZ/rhwbVaaj+bDVVhhL7oH46ccueehsI3kbn7wQPbco
	D+l2bF2vWiywYeschJdbcb6Bhkmb33GSUT7ZgbQ4rldKDPkyJ23irJabh7WbUIiO7pX+ZMjtnPq
	9Du2b1ewuIXreJllTwXgjK4pCFptspuZgAM0fqnlhOHi6RNpAkqhOxbvG9n444UMtcRqV30qTx2
	pwCYDefI13mCRVaI/QaGW+6vdiWnhTf2qdpAwYt63BLnsfytZ/5plQIPUZJbeMVfk60tcxMOS2T
	6el4iuccwQDniW4GacbSIeExMkMolXlv5kb1i05ozdX8DTLURs6bnDaNM6TTLpGBqtBcludpji5
	TzDWPaZmdhagarvTIiBjS9CbTYe/km6Yq5YMlNXTEvLodpONE7CudsHej4GDB0SyxlLEG1trQqh
	rY/ti2f6QIY6v8lIgxs3vJRJWHvnbfTeQ5yirR13ic2gG/NSzLaN8ovZAiG/urZyMsk6fyeYYXm
	zyIgA5oenbBtR9wruxZEc4vVV7AtXRckzXkgVE47GZB4m79TtI2dbHNoMyMLp3q6AMi/7fNFbfp
	ka0WJ6o+B3CS/MSt7MhxTdvbgAQeerb8kQMSbfA==
X-Received: by 2002:a05:7300:7a83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-36a42362460mr17331914eec.10.1793681233040;
        Mon, 02 Nov 2026 20:47:13 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm properties
Date: Mon,  2 Nov 2026 20:47:03 -0800
Message-ID: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204714_970498_B5523824 
X-CRM114-Status: GOOD (  10.88  )
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

The common touchscreen device tree binding documents touchscreen-x-mm
and touchscreen-y-mm to specify the physical dimensions of the touch
surface, which userspace uses via axis resolution (units/mm) for gesture
scaling and palm rejection. However, touchscreen_parse_properties() has
not been parsing these properties.

This series teaches touchscreen_parse_properties() to read
touchscreen-x-mm and touchscreen-y-mm and calculate the corresponding X
and Y axis resolutions from the configured axis ranges, accompanied by
KUnit tests.

It also updates wacom_w9000 to drop its manual parsing of these
properties, and adjusts goodix-berlin and apple_z2 to set their fallback
resolutions before calling touchscreen_parse_properties() so firmware-
provided dimensions can override the defaults instead of being
clobbered.

Dmitry Torokhov (4):
  Input: touchscreen - parse touchscreen-x-mm and touchscreen-y-mm
  Input: wacom_w9000 - rely on touchscreen_parse_properties() for
    resolution
  Input: goodix-berlin - set default resolution before parsing
    properties
  Input: apple_z2 - set default resolution before parsing properties

 drivers/input/tests/Makefile                  |   1 +
 drivers/input/tests/touchscreen_test.c        | 209 ++++++++++++++++++
 drivers/input/touchscreen.c                   |  18 +-
 drivers/input/touchscreen/apple_z2.c          |   2 +-
 .../input/touchscreen/goodix_berlin_core.c    |   4 +-
 drivers/input/touchscreen/wacom_w9000.c       |  10 -
 6 files changed, 226 insertions(+), 18 deletions(-)
 create mode 100644 drivers/input/tests/touchscreen_test.c

-- 
2.56.0.385.gac671c819a-goog


