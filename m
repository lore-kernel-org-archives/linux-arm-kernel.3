Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3918C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI/rghceFoKRDvJzmmhIiWgU5dI02A3SjLrHZWxVm/o=; b=ZQitL3IMs4u6OHSidNPORQNbSX
	XD5Da75n1LDHAHtn98iJUGyMki+1w98eVTwp4kDh8VyeTT38gQg4tY7dRxQB4uMHPvLPV1CLhvvUx
	M3PP+xLO1RT6ZSzpWaFLuPmUuUx8ClGFugSq6zzp1SdEw/wxbh6hpMJEZyq+7q5KR1MzFlIW4C2BN
	d1ksSjy5crczS7S4H9PwFzZs5DrwPDztuG3bMLYk9yLk2aHsC0qpo38WEAa0OBzyxXe1y/GOuXS83
	scUfixZeyJ63VCpv/ReNz0ki6YVtT4l/wOhb/7k4Pn/mJXyW+M6L/l2FRagwLsjo9e9I5PLw39fI2
	1/cCKC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XbQ-000000011gO-1HQ6;
	Mon, 21 Sep 2026 06:34:12 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XbN-000000011fZ-1Sl1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:34:10 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d9004a1ac0so16401145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789972447; x=1790577247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI/rghceFoKRDvJzmmhIiWgU5dI02A3SjLrHZWxVm/o=;
        b=j2PS2fcwwPo8uwJxkuttXOWFzkDaW0iXzmdAdtjIyspmIF1QvqV11DZ9wyg+JzC/dy
         qYf0sKKtJ45xTfMos24g7WcyPrC1TDt8L1sDM5z4eF1iCjKGA2ZK742fK6BAJWwGih6Z
         tu0azw+KPDwJ3vn2nTQR1IIzHP9YMTfwsK7GB3LLDDenp6Janp5ttdcAxCrWh6lE1Jz+
         TRP22KxUOlkXuERMB7/Uzx7STIvNVwf+p+TqrFNXji3UZ/D1ChTLsoYSLgwh3XbGw8tD
         ++9se96Hzx2u0fNi/CKr3D2AtpkbooYkSv8a4R9G4NIXv4A32n/daG2aJaGPWDGYNgFX
         kq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972447; x=1790577247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eI/rghceFoKRDvJzmmhIiWgU5dI02A3SjLrHZWxVm/o=;
        b=USf6OJrEXsh70MP9dT/s14l3OIIYrQ/sECJtOSii2TbzFrYaFmBPNyjzIW3l6oHVHL
         VQDF2lPJ4c8r0QMWw8hrwFmRhVRkibQ8fnbvg/U0SaGhU2+QWoavZ4EUcMhuec4HtFcK
         REnDu7SmOjpIzhRY8+LKq9rkNAxqAKfoWq83NMp/Ab4A1XWpfy/F0AIaTkb9Og8AD2W6
         tKA7KqOqGPMDan43Iu/hnfB6coqn3z5fGeUKQDnkJ103cFLDV2/SdwMOe+gxpauqpPKs
         2C2PrGUwcam+xHozBkMLsO67MxgIokPWCciCxvnobOheeGNBpz9WhV4mzJi7xCp/adZn
         2Z/Q==
X-Forwarded-Encrypted: i=1; AKwUvByX8F2dZO2sCmCJF7bZVaiGPbE+KMpsuK0kT5frSxzAZJgNTsHnYsAGIdvdSxCv7rniOXiUsFr6fdrEStKe2ebF@lists.infradead.org
X-Gm-Message-State: AFuF++ll1w+RofdKLiAxkiOTTXF6q2q7pp2XrgaK92x04XKkXZBRKKib
	G0iD0Yv39vgkP8Wh/DtesqXrXx9RzrTOiH8uoMVWzT45P9/Rci3S/m+Z
X-Gm-Gg: AYBFou1GJqnURjZikfGu7VVEexdYdvUizfHILIjv4d0F9chHmmZeeaiFA3F2sAqDfdE
	EOx4K4L+q4kq4if3QiVtIe4zMZ4QlaamV/NwFG46LelbxGsryEeByXLAMHMvoMVSo4CzH3eH7r+
	u5v5VIObC7BWGt9nhV5SqLWjLpFHXKvj+Vr9oGEw5Kjzw175P3b7zVc49p6RUU6DDcq1pOsR2/V
	Yy5/BN/wSGViyR+1AYK8sWYsdoGXCnNVOLOr3pVuqTN4p2bo2pLzn+lB3N335074BSOT/a8eqYC
	CuKTNA178AXO/FWaYvtUb6KJxR94pymwn1xf1ADcoS3r42pr24MRlMkAz0NDLTUG7OJFjdYae3n
	V4WQL+px/lNWxmwuR5UXgedDxPhf/Pog1yDnFuTlFgoi+zcqXRRZQg47xOlu/xGphuh4RNQWJA0
	R/ve9lcutB12wl4YAURPuU7q4civtEkYkO3J7eO/wzhdv5w+lPOJRz/qYZO3/sfOt3s7PTy284c
	CVNXPav0hE=
X-Received: by 2002:a17:902:e751:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ddb1ae69b7mr148847475ad.12.1789972447082;
        Sun, 20 Sep 2026 23:34:07 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17888a8sm28824695ad.26.2026.09.20.23.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:34:06 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: drop unused i2s0 from rk3399-firefly
Date: Mon, 21 Sep 2026 14:34:00 +0800
Message-ID: <20260921063400.2020-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260903082713.192-1-yaozhonguwl@gmail.com>
References: <20260903082713.192-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233409_379612_F80C11AA 
X-CRM114-Status: GOOD (  11.84  )
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

Please drop this series.

The commit message claims that nothing on this board uses i2s0. That is
true for the DAI, but I missed that its pin groups also list GPIO4_A0:

  i2s0-8ch-bus           ... <4 RK_PA0 1 &pcfg_pull_none>
  i2s0-8ch-bus-bclk-off  ... <4 RK_PA0 1 &pcfg_pull_none>

That pin carries SCLK_I2S_8CH_OUT, the MCLK the RT5640 runs on:

  rt5640: rt5640@1c {
          clocks = <&cru SCLK_I2S_8CH_OUT>;
          clock-names = "mclk";
  };

Dropping the whole &i2s0 override therefore leaves the codec clock pin
without its mux configuration and analog audio stops working. I have
reproduced that on the board. Sorry for not catching it before sending.

The correct change must split the MCLK pin into its own group, attach
that group to i2s1, and disable the otherwise unused i2s0 controller in
the same patch.

Patch 2/2 depends on this one - with i2s0 still enabled there is no
pl330 channel left for i2s2 - so it cannot stand on its own either. It
is resent unchanged as part of the v2 series rather than separately.

Could you please mark both patches as superseded in patchwork.

Sorry for the noise.

