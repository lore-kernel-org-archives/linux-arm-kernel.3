Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA2606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m5RWZR7A;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8ftD0d6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=; b=m5RWZR7A5r2Y+1pXFJ0g9ysWmJ
	tddZnP8AxAjTEqsU/VO1ervONK5llMVqqxNcBBtccYIbJoJmsaaLBwzQAZ4guTrc0JQK7fWaZPK1d
	AsV67sn8YYqgR00MSvoPLbL7p+lnSEFAStmNaEnVz8f188oJKwXQikkXZ71DCNWP5OL8DG3fkFpbF
	kaC3OUT89ddtuRebp2RPs5K3FYfSeg4pCBrd6gw3+PLOscxRwyB1NeBxds2vGJcUkEAqYgsIyw6GD
	+XcOpbtXj5oOqIEa6K1gQgy27hzT/tIQKhHs1JYzVpLYS6zT2wtkAjpZTBReMH6gM998X26gKaLuX
	THjyIpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiZV-0000000FRJp-0aXy;
	Mon, 02 Nov 2026 03:18:57 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiZS-0000000FRJU-3wBN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 03:18:56 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2848454c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 19:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793589533; x=1794194333; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=I8ftD0d60EKg1K+S4v79qrwaeXD32cGgLOKxTqXs22hNBQqu5LMaAAK9bLrTMWTPew
         cI8XLTPIX288w5eCvGCHN9z5HPhtl7G5RK/mjuYQLXwQhMen5s0a9folUcFwwpQCt6TW
         Pbu1gz5oNDzMNMQgSHemuk56kWRemRClES95wZ7LG00R8+/Ji4m91BC1pBiBRvwN6CC9
         06EcDcLvy4fOz9X/fr3FBIFSq3hUM9WHCmtJqUwVyvI39ns8sPNKL18slaYh8TzkpfsE
         cKRSeQaH8UW+5yJgu/gWGhnYptviXvasYttH+s+uROvXPpKa1MMOeM0cEKsFCWx+fkxn
         nr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793589533; x=1794194333;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJCnzPlEYPTpiPpNwhFLsc1nTWFuyJzYXd5f4tSr6oQ=;
        b=EJ/Ajuk+T+/S/PsMwWjJeMy/cGCs4Po8CFUwQKAu6ViSJ/22eTsbte8cS49vbgskRo
         KckO72fv75DvOXg9+FLezCJxYxvpPFid5ICzj0JmYD2N2Q8rZb/OMevanebCg78yPdPD
         5FJud8bggSz5QImSXILhMr0r4jpdtLelXjKP7a6l0WNMnN/an1I0n91uJdsIv5RK/aLM
         yOyGfrmb0QYvZxYg/rgfMK9LTtF4MIIvAV29z282gp/XM713WKrDeCvennpQbF/dsgQ6
         wcoU8LKrrfS/QAmfLr7Xz8r7KrLadd4BLIgR4G0JfKqpgDheghEIIyGDuGiLQM1jEz+V
         XM6A==
X-Forwarded-Encrypted: i=1; AKwUvBzlgJeABvp9G5cnkP+yX7w4VgeO1TyZ8TXsu0289V2FaowijsgWVxc2vQn5M0Tmfpi8QmpsL8INUbCzFB7nmkm4@lists.infradead.org
X-Gm-Message-State: APuU4Z9Hr59/Bf3dD0kFDSBE8cGq8MforGDnX5EgoHIrggOVCcBbDKFP
	/NjJlCfcJ7GHhwfTmHxM4Ardt1z24NVIrUTAfvyGr8NaSVBuw1XjEjWp
X-Gm-Gg: AYBFou2LBgIGWHasDP7MnOpYci1t5W6YY3aDQS3ozjoKclMY3ei+z6/hrCRxumYRePx
	nOCYKb2E+7OKqBNnoYXygNXrsLDiY2dZ4ELJ1uk99O2tzHfK7PMDBJIXheAAIaVy4/wbjbyYeMu
	0vicx1Pumf0uM0TMDqDngVp0FrS4VReXhbumHU9uTEb80+S39BiddcI0cc1HiMcxiMydcS6xIEA
	ckdUiUFXTc30QpR/N0/HZ9Wu18Lqj3YN0BGUqM2Z2MIRmtrE9V14lP1ePiSgw+jJkC3vkeQUbHh
	Yt3A+x0XAuMeeUiGShyBt5zRr2/WJG245qcYGrfRgGNuVxZR78GVa1RbQDrEIFwWZiqQFiY1TMW
	Sr8QO3DcjH5ocYUjfxlYLYD7Y9RlEsXp6M8NevtzpBEWvX03qvgJ2lSnuvY3FowmY5Y1Ds6qsNH
	A1/iZXJqHlSSDVQwkUxAMrVey6+enH8XccLlKh5FpuXtlc1t3oW5jEW6RRrTJquokJ2YW9g6FVd
	G9m+bHtG6oo0LuW45urDpeiUnisRSJoqj8RS8B1cyEkjM//OCpdZTO3e6GPjgNxP3t7691TiE7a
	XYaRgZ4ELi8D/Z9BfHozJB5tvHW/1oOV0UMLc5lEceHRbTmh9Ii+qPTwS6ww17fv7SpiDyc=
X-Received: by 2002:a05:693c:20d0:20b0:36a:112d:fae3 with SMTP id 5a478bee46e88-36a42435927mr13964731eec.40.1793589533040;
        Sun, 01 Nov 2026 19:18:53 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6eabbsm33411882eec.24.2026.11.01.19.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:18:52 -0800 (PST)
Date: Sun, 01 Nov 2026 19:18:51 -0800
Message-ID: <4590302cb7f26ea6173018f5d7083977@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/5] Input: support for STM FTS5
In-Reply-To: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
References: <20260925-stmfts5-v8-0-0fcf49e2c85f@ixit.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_191854_991303_80AB8FE0 
X-CRM114-Status: GOOD (  13.86  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

On Fri, Sep 25, 2026 at 11:22:18PM +0200, David Heidelberg wrote:
> Used on various phones. Minimal viable driver.
>
> Includes device-tree enabling touchscreen on Pixel 3.
> Also, tested on Xiaomi Mi 8 (device-tree is not yet inside the mainline).

I applied patches 1 through 4 (leaving patch 5/5 for the Qualcomm SoC
tree) with a few small adjustments folded in:

 - In patch 1/5, added a missing trailing newline to the reset timeout
   error message and fixed a typo in the comment in stmfts_power_on().
 - In patch 3/5, wrapped "const: st,stmfts5" under "contains:" in the
   allOf condition so the check keeps working if a fallback compatible
   is added later.
 - In patch 4/5:
   - moved ABS_MT_TOOL_TYPE setup from stmfts_setup_input() to
     stmfts5_setup_input() since FTS4 does not report tool types;
   - dropped the undocumented "stylus-enabled" property check so stylus
     contacts unconditionally report MT_TOOL_PEN;
   - checked X and Y resolutions independently before applying the
     10 units/mm fallback;
   - added a check for !sdata->ops in stmfts_probe();
   - fixed the GPIO name in the "mode-switch" error message and a couple
     of minor comment/log formatting nits.

I will also send out a few separate follow-up patches shortly: one
teaching touchscreen_parse_properties() to parse touchscreen-x-mm and
touchscreen-y-mm directly so drivers do not have to open-code resolution
handling, plus a few fixes in stmfts (not aborting FIFO parsing early on
non-touch events, validating the 4-bit slot ID against
STMFTS_MAX_FINGERS, and switching coordinate reporting to
touchscreen_report_pos() so axis inversion and swapping properties are
honored).

Thanks.

-- 
Dmitry

