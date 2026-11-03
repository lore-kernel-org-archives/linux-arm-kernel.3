Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66A606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PgLKXQxg;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h78e/De3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=; b=PgLKXQxgVDjS6XteIVmO3hsfQR
	t4yT+lF/QB174YUklzUoujFCxhuRY1yVRaWoCmYfyHg2SUom09mNDE9ry5jK2Je8lP6zv5/G3RT0y
	IWNyjXq/UNGX1WBu79BHXsNkA579Btgb3HtkXCX//RRT3mp7rMxXE7SuxYXmJZhv3ED5m1ZHaL8jX
	Gl7Q4xn7JNpiBBYsGuOQzVAt6rWM0DLw0wxyQmn3kwREFnGjoKRgKIRinvEf+nhc95A4665DiGXA1
	i076kQALVme5RgCfUAzT/9CM9b/otLIcFf6Trro6xg/HHyfrsEEzmCslRDMuXsi10LYjAOmnbia64
	6BeE7TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHb-00000003Qua-3C05;
	Tue, 03 Nov 2026 18:30:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJHY-00000003QtH-3SjO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:30:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so34357055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730651; x=1794335451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
        b=h78e/De3WIobd+OncdBZbJ7yMFAmNrQGr7W7bboB4yq63xJBZCSy9ow4mfwSfk1Vem
         ja06mOyqbxWfEMU1eFYBcCC/8VwXBFnRSaqKLKUkucnim5wVwnIsZOV0z848HIMKJlMu
         QsDrwO69ch95+YMfQynjQW7kDTswzLgF9GTA/iYt2BImWIf/R9Fjyy3LSBuVMeJJl14f
         Qp5j8Q7gvgT8d+NahdiLBkaUvj/zSIWueavzB3MrIFm/ptiEdZtp2SFO5jRBSk9SbXBJ
         de3IqE+ppzbIggLjlzliaDjx2RcOEu1/RVFbLRlwIWqRgDRBX5p8ywom4vdA1N8I2u08
         0kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730651; x=1794335451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
        b=NTmBqYHZtGtaNqR50kJZrXS9aPRpVRepDae9v6VNQeZfO5SlDZPp+atT2AqdDb4EiI
         6z1lNRV5QzZnRiqyF74kL1zZx3538stPVkx57PyZW58amwj3hm6PrTFuTa93GtpK98eo
         qKVhfP51iOxu2WOk8sQLXDs7ccGUccsVzyjNAhGXqnYG1gSDkyKksbnFeIUZ54W1ARyX
         j3sSMQelfXbVU2k2VTF5kXn/NZEqYi8Aw4Ud3ZP37CVRskWJ1zJ3Wg8zWll/gy8GZ1Pc
         miBOt7LDU+SY0Wc26tFGE80DLKX8WxRhB2xZkLopvQC8cZdDZrBWjvvmRAZilG84C78V
         meaw==
X-Forwarded-Encrypted: i=1; AKwUvBxm1VNbxHIKF0WfoTn8Iw6KJ86xcERSyFtykG/E6dV0W3bMLlWtKG9CEt90QjO+AtjlN87geS25E0hvvIlOirCB@lists.infradead.org
X-Gm-Message-State: APuU4Z+YnvCt5vYyx3CXoZDgnC14vvPZ9qaBtCAlyqFyeoTZFI++JwIs
	xHiQYCLmM8df3OJo4jHiAD2hOrm3YyO1v/TI1/OwVce6PrcyJryVmnVE
X-Gm-Gg: AYBFou2TuKWicIhBUGufgPsNXSyAlGSilJNrIjrILzkMuvEXReNVH6NxFBFUOl52nOB
	qNp+OcI0hWAons++ExcIalUMqUskX3oVQWf2oP5QAZirBLQJdDsyn5QVq61n+Bbp1IAKA2+oz7k
	mucUQ9tyh8Q/P5X6RQORVBPOIe/4Mud3JpJGIeQHt+1i9n27UnIFsrNccCZbVODLi7CwjaxH7nT
	pd/JllJGSSglBagCQk2iCHThXpQKwb0DICfPdolwJaLXvtNg539Q+A/eqm25tKzghOE60LQIK1/
	/aYik3pPPt9oYUVZQQTyE3ubFrnnfzyFBtCkPwZ4RUYpHa14SgTegF1x20gXcT0wEN9rS7c8AFC
	JExfFGhbldoDJ4UJDy9yLDh5A/pmrWydNx2I1sFJla4UH4O5tBZe8KwVz5ObUVUJgfqcKPNueTG
	03/cR2OZdy7aPPcdfQB45hylOMuIxiNAtVg2NS7E7F92YaKjNhUNa7SV+Hrp4/eC1QJyrZf4zbo
	qc/34qtD7MkijUZMgu9Xz5zaAYyAO1JobH3M109UqkBXS+vfF1zWVszq2biSd3ns0gZseqGkvIL
	VihRQPqdjAndfOPm5BnBUe7EnTPvbbtk6wy1bzhSYFfPtIxDkxyO+FJRngK2cVT/37kWfZoedgW
	lkpX2+FRwgdQ4VR6z2hPj0DF9jGSAtX8lpoi6ByH/YI82k3KSSCUl4uuCdPpqB9E/ldAjgB0F+U
	OjdBAPNC9tmDJphHFmpK1G37THyJAdpKgt1CtLeJT2zIQTgXElNcE3vG0+GF5ZzDrzHbamcfuu/
	5Ds2n06gViQ9A1UhFwtLeyXh/gyVpqsRo80gOPFbpWIzjGeTXgfWJDR2Eik933qyIBwnv4=
X-Received: by 2002:a05:600c:3f10:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ac1889cc2fmr303664565e9.19.1793730650716;
        Tue, 03 Nov 2026 10:30:50 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:50 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/4] mmc: sunxi: fixes and preparation for A523 UHS support
Date: Tue,  3 Nov 2026 19:30:26 +0100
Message-ID: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_103052_881027_1E83E9A8 
X-CRM114-Status: GOOD (  12.29  )
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

This series fixes a bug in the sunxi-mmc driver and paves the way for
SD card UHS-I support on the A523, which will follow in a later series
together with the A523 clock phases, delay-chain tuning and the PF bank
supply switch.

Patch 1 fixes the manual stop command error reporting: a successful
manual stop command is still reported as failed, while a failed one
stores the error in its response instead.

The remaining patches improve the DMA setup and error reporting, which
the UHS-I work builds upon: a DMA mask matching the shifted IDMA
addresses, IDMA descriptors built from the mapped DMA segments as the
DMA API requires, and CRC errors reported as -EILSEQ instead of
-ETIMEDOUT, so the MMC core can request retuning.

The series is based on mmc next, but depends on commit 5e32202f532d
("mmc: sunxi: fix clock and runtime PM leaks on probe failure") from
mmc fixes, which adds the error_disable_mmc label used by patch 2.

Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
and OrangePi Plus2E.

Best regards,
Jernej

Jernej Skrabec (4):
  mmc: sunxi: Report manual stop errors correctly
  mmc: sunxi: Set the IDMA DMA mask
  mmc: sunxi: Build IDMA descriptors from mapped SG list
  mmc: sunxi: Distinguish CRC and timeout errors

 drivers/mmc/host/sunxi-mmc.c | 122 +++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 41 deletions(-)


base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
prerequisite-patch-id: 8d600908a2eb84acfcd034482dd6e345242f1464
-- 
2.43.0


