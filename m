Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0CBCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 20:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=molth2GBLbQtie58J3t79qgVjBqQGYkH5jxljtxCV3U=; b=BsRwex+t0MUUGplViy356cbR1m
	6KryWqJDxZex2qFQuT4myfddnctnVy1jzpJ2mro8Iy3Io92e+USCLNw9E+NnXX3rZwKQYGLC4iN6l
	Bdix5xsG0em/iwjGugUkx0OtHIJmVzzb/noHyC3c8e39CojtBlZigztFSmP++R9XGhPM/8xio9N90
	24CotYssBtoJspI4bSEkyeQiMWU4/ysosLY4u4Ak8qhCBQXT3pp3qwwday7kGLMnu9CGlNHbeOD6/
	53LZeSYgZ8JdKy7RDmha9/LelQTyxV2KNwTdq1HJVYV1zzUWsu3dwZsm9USn2WGf7Pzc1NIRbpVNB
	7ipD8RWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL5RB-00000004pHG-19Nj;
	Thu, 07 May 2026 20:35:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL5RA-00000004pGr-2Y5g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 20:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC4AD6057A;
	Thu,  7 May 2026 20:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B774C2BCB2;
	Thu,  7 May 2026 20:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778186111;
	bh=O7SjoYbuE+fUaAVS0x3DNy8FdfsP7AM82UpuimFtss4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGC4JFyC5je/XAzG/ze8DMwCeIPdcveweRg4CsPtN3rtsJUBTNY3GRQBuntG0/0/N
	 yDqzVvc+xl1XE/ppSluuooPrTHQKyiRD1644de2xIyba69RRd0wZUZzAbHFCbIp9wR
	 Osq0IcUtjRDhMcSoxwlGu9RLPIt2+vHOGKLyGc14dC2rTyIr/MKyX/iUF2uuRkhUpD
	 PLlmW+RlBUyCjcHMw+hqPxk+slesJ3azoUJFoQz9UshVKK7rthzOkNQxtOaDie5l+Q
	 a+FRmQO9UhvY1UKDkCwhK0UMqLLQjEDcDOsySMcxuU9pySlhqHRD+4Bj1gR5ABvaZM
	 CQp9cy/h1B0rA==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@oss.qualcomm.com,
	marijn.suijten@somainline.org,
	swboyd@chromium.org,
	mripard@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.clark@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	sean@poorly.run,
	airlied@gmail.com,
	simona@ffwll.ch,
	alex.vinarskis@gmail.com,
	Abel Vesa <abelvesa@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	quic_rajeevny@quicinc.com,
	quic_vproddut@quicinc.com,
	quic_riteshk@quicinc.com,
	quic_amitsi@quicinc.com
Subject: Re: (subset) [PATCH v2 0/3] Enable mdss1 Display Port for Qualcomm lemans-ride platform
Date: Thu,  7 May 2026 15:34:28 -0500
Message-ID: <177818605989.73000.17904412003794862832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 25 Nov 2025 16:26:19 +0530, Mani Chandana Ballary Kuntumalla wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
> on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
> lemans-ride platform.
> 

Applied, thanks!

[2/3] arm64: dts: qcom: lemans: add mdss1 display device nodes
      commit: 3e6cd0c43cdf678622c19210bd1a70b04c8a79af
[3/3] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
      commit: fcc1a19f5bd5623c448e54b2ea6d50249abea77a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

