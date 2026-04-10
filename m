Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05D3E99050
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2u8807k80N/o8AudH72Q0tlw56Nmjjod+/Et+0EN0Jw=; b=B0DLC8FJujgMkvYzdgeFj8dDpN
	zZ6SRU1yTSsGdZvShbSEug5bQk0OVfbT9EIp+1hrPzSUvmkbSQ8B9UwlcheS2dypJwpQ964575Icu
	4k7u4EqXXM96RrWm0BHR624q6bw5oicxTkcU0W+mH0K1q89VUqu82ElFgJwCjjfg9L2SLsit5t+S4
	3AqOYtFDI11e9HOkE5rcJBXva+hA7kCV6L9E2189Qd+jpy6zvaqkEbQi0X9BX9rAbEnIyDfpp3zRd
	BbZkl3dQJ1JGMH/FV2gHkpAS1C/QQzUvKaNEbn767E19GqgGOOunsHgjUQifN3dqbdH/H5zczbtZC
	logDRaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6a4-0000000BnIL-33cW;
	Fri, 10 Apr 2026 07:47:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6a2-0000000BnI0-0vnS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:47:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ED2C418B6;
	Fri, 10 Apr 2026 07:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D84C19421;
	Fri, 10 Apr 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775807225;
	bh=2u8807k80N/o8AudH72Q0tlw56Nmjjod+/Et+0EN0Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/Lj+MarNqx6wijAaL5jxtCcWbdC0kz7Q28QWsdJ4WXMz4xxJkyRQ9WNdR6qJ1e0F
	 8KQ4RAo58xextt+8r3VF97htN8KRKAbQ2kjTF6ZK97Oh6QDzfYNSf/BkFLOEOoa6NO
	 Q10nhfmEbTGUawwua1uIZOAVehA4lcGuqqu5SwebL9OtKA4w/D1KiwTRN19nf58TQS
	 XFb35lJrQtrnEH3rCBHE2jqsQC+cStp5vn4od/hqtkhS5kVOM1DPXbJISZMzYGYjP9
	 Q7YMtm2YE5NSaPy5wZ/pHYBRldj0lqFylvtujP9DG5mDJDgDJxLq/lPqWIowSkg9mY
	 QxhqyO/XdS3GA==
Date: Fri, 10 Apr 2026 09:47:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Ajit Pandey <ajit.pandey@oss.qualcomm.com>, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
Message-ID: <20260410-hasty-pony-of-tempering-4f0a47@quoll>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_004706_307486_19633FB4 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 09, 2026 at 11:40:44PM +0530, Taniya Das wrote:
> Update the compatible and the bindings for CAMCC support on Eliza SoC.

I do not see any update here. Also, no improvements after v1 comments.

Best regards,
Krzysztof


