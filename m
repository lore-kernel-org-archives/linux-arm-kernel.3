Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA48B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nHSxR6Gp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FwTYpO1d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1sm2hc3YWGgsvsgSDqn3L9ODNcpGkRux3zpwGIv5W5A=; b=nHSxR6GpnQiCzZVzoFe59U25sl
	xZitm9nyiYvRXd6B1tAjvit3Ftc7GsdnP2GkOnVg7S13Ae9E4CSh61NPiiBq7+g6As0+Grdjp8S6B
	tsH4Yd7603UXKccMue9u0IUj37zV/ksdrtjennILOQSpt4JnE3iVgeETxE+iTUenFsqkblOtW3oDj
	NdmAK6JbkB468wnakqjaHm2Gd9tS+zS7sa3+/UcdvqJ7tYlj6f0SHOWNqAJYrUtf7AfRQbbv12Vm2
	cLsqDqSoW1Jo9pvWHGAAZKRy4SjZg68KlVgAw1INyWSEEKG/eBVRKvink0ylEPT+J+bJo7FT7JbNa
	x783KtFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxh-000000037ZH-0Nng;
	Mon, 26 Oct 2026 19:02:25 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPxe-000000037Yd-1UAD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:02:23 +0000
Received: by mail-oo2-x09.google.com with SMTP id 46e09a7af769-821a4a69647so1819356a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793041341; x=1793646141; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1sm2hc3YWGgsvsgSDqn3L9ODNcpGkRux3zpwGIv5W5A=;
        b=FwTYpO1d608zfH1iyhFUc3b+104jKzrSEx127UWlGxV6ldGg20P1VaFo02UPrGGZ4o
         Zd67wn7lXQvKXx+MDh5L1bNx9QFSCHRk1TV/SnmuHaO/sPooh9E6KhQDidGkBb2x8Wwg
         tkg81ORdKSN4H0xBdTGzOfGQWK0Wyjxo30u2SscCojpr4MdpmMEyLJHI0vHVwUPe1AMB
         hTKfXJdpFJTokVoqlK6IM4ulYLu9rjxnRl65E27yMXxNgXrl4T5mmJP/zqvdI77QPyex
         8nQq1aLuvq3grNI0U1zm9/DrJj9l3hfSJyMJaO4CYSEibPsjWnQWXHeW2ucVUTdcNI+K
         ayzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041341; x=1793646141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sm2hc3YWGgsvsgSDqn3L9ODNcpGkRux3zpwGIv5W5A=;
        b=dqxcbTfjuuRpJBR8O32hPOkDwnFJxUT21GU+7t5wTElK16/A7RD+xSGcKZBf6yZDwW
         /+ENADSjl3uVJWvdTADR32c62Imtlj+O8xpQGg2eIkjgBbDbgqWQlwJHjxB0SJf1/M6V
         EW8v7/sOwDp1tr480jxA1PVZCE85s0A1lfOOGGN/BrdskYo5jHNlkCfh0Cf5gQhJXguv
         mhmeQM4K93QEwQ69/Tqlx6UQmW/kVhpqU1rxaFIi1fmOch9AG8dMass1JojTqbhMUWW4
         DDxXhwu2O1U2B1aZjwP2MLI3uM/eHzZVCM0nVEE3vTPyWbkkBUIEUkQiucB/hDehtPe4
         VefQ==
X-Forwarded-Encrypted: i=1; AKwUvByVpYHz8aABozSZGjhIRmKcpzvKhSMR7NxLS47fhPnZ8G/HeorXj/vRiRGjpi6lvkDTyZkNn73jXyeZGwGJYyDA@lists.infradead.org
X-Gm-Message-State: AFq9FYKxTOsnIeGpA6RnkZQcgF25l0IGbZfgJtKhUWK7UgOrl3V7E7kg
	ie21dHi5cnFEX0iv5duhtG2ylOOBuBPq5NRoPB+ehurr7XDhe8e9iDMe0vgFU6Jl6bM=
X-Gm-Gg: AYBFou2PyfaG+pY8ZslCv3GT2USkk2aIqf9y7hI67IWLWqUOgpY9f6zjJaqDgetj4mp
	wrb+XAaPdasvU2zcPupNyTjsWyOZsptWiU944gwnhLB0g1Zs9AO2YhHgqxlz5Ff/Bgl8W0gMZp3
	vt3TTDPrNPcIHR7K7zOR36CT0Zx4c3jgdlFglS/cPsg3rCJXgaJHCzgMTGRQfSQeIJDvT42I2dt
	LmeRx+GYX0Vj5zL3sDHWQlVjTbMeb1hPokrXNNHxbXtwTQoEl6fp/6UlarHbxGhs4lEq9shZcdz
	dxd4bHfgNIKEksC2Wv1qdaeVsC9lK6K0LGntHqgsRRpF2fgsgrApBDAQ9mdYhOyfTcSDe573LEq
	07sYq5lUhUBdsSPSw3qpMRNQo1EilFGUpJPQ7zzVCBRDP5U0mHRWi4yXtItoxbfPBXbP7MxLD5m
	a+bE0Sw0fOOqfz9wbPtaB2pOfvbEzeM48oLP30/8HthQfTL/O1zx59IDPI066skFj8rcIHH0a9D
	Xiw4Et5l+tlaqSfFgiRiNuUSkq88SfSIQP0TS+GtzvQC4U998i5ZiUGTPrIJaKsYJ+AxmlPQKzE
	B0kCuSWoiy1G4FyUwObp4VXep27sErn4TXg5NxjcTJ+y7A==
X-Received: by 2002:a05:6808:1301:b0:4cb:818f:d571 with SMTP id 5614622812f47-55c0025b87bmr5612703b6e.25.1793041341117;
        Mon, 26 Oct 2026 12:02:21 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c04311a8asm5958356b6e.16.2026.10.26.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:02:19 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] Bluetooth: btmtksdio: fix MT7663 setup next to the
 Wi-Fi function
Date: Mon, 26 Oct 2026 14:02:12 -0500
Message-Id: <20261026-rbrue-sheldon-upstreaming-btmtksdio-mt7663-v1-0-121792305f72@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrDIAwA0KtIvhtQJxa9ythHO7M2bGoxtgxK7
 z7Yu8A7QagxCUR1QqODhWuBqMyg4LlOZSHkBFGB1dYbbQ22ue2EstIn1YL7Jr3RlLksOPfc35K
 4Yu6j9zcMIWkXRuu8czAo2Bq9+PvP7o/r+gHmIKJrfAAAAA==
X-Change-ID: 20261021-rbrue-sheldon-upstreaming-btmtksdio-mt7663-99d049724644
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793041338; l=1556;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6qJwEv7Uc5GPnWb4YaFtFieR4chWToQkRjD2wM7nijA=;
 b=72qqkFwF9FgiJAEB+j5/HaEH0yUzFNF6BlW8rZzrGZefwnlyqwa2toYqOLqF+zVSUi5bAnqOU
 TpNXaoo33i6BwD3S4bBj2AcCfza4WGrjKTuBsJ5CxPaYuqTviIDkXKB
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_120222_408474_F194A000 
X-CRM114-Status: UNSURE (   9.40  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT7663 and MT7668 combo chips the Bluetooth and Wi-Fi SDIO functions
share one ROM patch, and which driver downloads it depends on probe
order. When btmtksdio probes while mt7663s is downloading or starting
its firmware, setup fails, and in the first case the chip is left
unresponsive until reset. Patch 1 waits for the other function's
download to finish; patch 2 retries the function-enable request that
the chip refuses while Wi-Fi is starting.

The matching mt76 fix, for when Bluetooth downloads the patch first, is
posted separately to linux-wireless.

Tested on v7.3 on an Amazon Fire TV Stick (3rd generation, MT8695, with
an MT7663 SDIO module), with both drivers built in: six boots in a row
brought up both functions, with each driver downloading the patch first
at least once, and BLE scanning works next to Wi-Fi.
The patches apply unchanged to bluetooth-next, where they were
build-tested with W=1.

This series was developed with the help of an LLM coding assistant.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      Bluetooth: btmtksdio: wait while Wi-Fi downloads the shared patch
      Bluetooth: btmtksdio: retry enabling the function on MT7663/MT7668

 drivers/bluetooth/btmtksdio.c | 63 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 12 deletions(-)
---
base-commit: 27731ba091954eccddb2657053b590d2113e8d98
change-id: 20261021-rbrue-sheldon-upstreaming-btmtksdio-mt7663-99d049724644

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


