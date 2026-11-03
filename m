Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4DC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z5W5sW+6;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H2DtWtEP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=; b=Z5W5sW+6Pr/2wf
	MAK9/hywCJ7iGMwAOuSfTpxNbJNTzvHlxniaeJQtc0DRIy1YVULbGfl/lJqlgIIH8Vdb0kD+o5HKG
	kRnZ9vRqeTzeXdoplmZFEhPaSK8mS2X8Rgu3KYVii/cpXXkgFK3TJswbuRpU6FJuVf0fOdHfc/eMW
	7NZ4YbnB/hEUzOTo5kSXhK2/6cYXshooG1g1GjaayAcJjb2IFWY+PCmVZQqmVktXWETdaMWmF3QXE
	YVgtLI431QJQy1n7znxtgRMkq06rG5C8Sv0cZTXFWPgEQd2av1IxJzR88nzG1SofzqMCtT5raI9B4
	ZG21o+NcZYDLNtzqwbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hv-0000000149S-2qjO;
	Tue, 03 Nov 2026 04:38:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Hs-0000000143y-0dXu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:38:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cd3310348d2so131206a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680699; x=1794285499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=H2DtWtEPwfrM9Nf3YO8ZVME2zLsXwVy47fCDdobuHZNkOi5rINBATEV3K7Z7oEPISk
         L9fA4DKjFxJ5akRZa/g/MLiiLin/T0UQMGaujcaYkpHGqAVcYR0JWgtA6nByEDs5DeVB
         OSdVyPDPqbD1AEBkSRUwoDkQV7l4PYdIpSNEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680699; x=1794285499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=ZWeU9tJkYBNrDQusx2+y+JGXW6yCE8F1Zom1FpkZCfo27B1AhyLgXjUFpDirxF1jIQ
         7yU45o3kkutm1zfsbjOqgLLSk99LA0iN5LPLYiGl3JWciTtCvglP8PeiK0MZoFOjKL2m
         0ZFHxbraTz3D9D15fc+6hkBAkeIzBgrTYNkHTIzUK22j1Gq0rLE5IdoJHopRpiDXE0pO
         COxXAgP9R8QXNtrrjtB1RDwySz17gnIBQLx4dez1dNq+Q865Z7ipMSoEGaBlHwa56Lm6
         x29PUywOJdL/pDa8zpjkQk7AIc2DrjfEl9TNdeOEi464L9MzJJ0VGK9jffx20KhuWznf
         oI8A==
X-Forwarded-Encrypted: i=1; AKwUvByFtMLbW7TrP3dF90xP92BiEtXwwzxUKDtATcEpVzJL3bpNJJEh9FxrI+KX+QLkdUSiSDfejjFuvVjpElyrNf1j@lists.infradead.org
X-Gm-Message-State: APuU4Z893NouEBhHBYUb7d2+34/lLOlkqX0L/W9UGng0nVne7bcF1KYh
	vVcIPkgEUavAKofPm9DbyNxA4s6KxE3jTxms38ZMnxpup+KJ/uz7mBfR3RgZWBhDXw==
X-Gm-Gg: AYBFou33b1eY+Lu9hW3EfIC6MAsAE9vJ/fsQqCHzSoD+2gqmw1pxfx5WRBsxGjVaNi5
	4fTLd5z0DGR+29nS+6jC/MKxTq43hXqdFcntbW2aj8+UQ2945c1A1L49rzrtlwRzQDGV1XGHapD
	jAHSODl2GTlNnqC8lBZeP/fJaV+Rgq7r4QbM2QvTPLNNgRpUBMy69UT/Op5ALBRilHtat42bf4/
	BJQCigmiQXEVtCY9D0ORWYCI13SfGGgAl8yT2gxGiCMqwt7l6Sv3zAomemoRpa/KQN3wHrpncM/
	fE56okq3+d9ey84LfCRm8cMkGoESfQvvwosKpLKFz7DmrGsScs9HfBZcaZ64DHWdZLiA/+jW6Xm
	X9h4T2pnd6KAjEGU0jV62zLbHaP3s5ueMEDOgyZ8uVCo8cmfdMRap/sFG8IdE1cbNuk5a08Xyhl
	qxFFV6P0NqSkJqi/0yo3W/I+KLeS726G8H/ymYPPJyUzILtxWeihk7uIIEyE5WkQHYdGvHilJJY
	zESK/JPWVkWR545EsjmRiGpvFF0CeJJ74XvStaP2rilIHZSpCUYel90nPQ9egA25d3ZGqtb8foJ
	SLu7XgXmQsOvUK5+Q3VwZ28V1PeR00+Uwg6wwWFbbUO/6bN/tpeiH2Ju6StU4uI/RoVwc/JLJx/
	t9aQp+L6f8U3H1jIm5W0bUCQDlnxQl5PNGA==
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr6631601a91.18.1793680698982;
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  3 Nov 2026 12:37:32 +0800
Message-ID: <20261103043734.2179858-9-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_203820_195499_40404EED 
X-CRM114-Status: GOOD (  14.93  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.56.0.385.gac671c819a-goog


