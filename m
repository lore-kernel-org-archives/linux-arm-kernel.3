Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3467CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlfP0VetgKs41Qf2UYWtLeAZdZiBKKUyFtRjTgmHDK4=; b=Wmq/AAvI4ZJ9hD1fGxPlluL+TR
	zEvD6zBGuuf7MicD4Q605sEJNn4xCpciCCVNfXmL/AomijaAcDIV49ZSnIBn0eOzvkz8oHul1DjSO
	BvscabK/IdjwTAqUsq1AG0inUrniuNf2LS6xYfR49vKUP1Fpw306+o0cjZxvnDkRGslVh4dzQfbex
	lFxrLBsL0UQ/z6v66zJBTH/XtDiKxCbP4FdzLcfX+bMAW/p7F8Auc2WQxEz7YL46qvNMJUdcXLfYL
	jEefZQb8LGndZoriTY7MvN0GjybdjLtf3kXDk7jsSwJbbd6w2e94i4By6IJCgZw3F9/8D9LIgnw+q
	TD25yhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmiq-0000000Cht9-1Dfv;
	Mon, 20 Oct 2025 10:02:36 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmin-0000000Chrm-1Lxu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UlfP0VetgKs41Qf2UYWtLeAZdZiBKKUyFtRjTgmHDK4=;
	b=UvPDScRhxxrNnRdKq9YBwOvp34T8zAgVT09Dqd5Ix5HmxyhBjSeliEl9lD/U3i
	/KO8cbHFehRK+amVNYQOWp6HhIGq+0aSFfRDIFqwmeOEbfIaUYaxZNj3pzEbs4rN
	ktQ2bMgW6ENQgYs4ZQx2mMbJOOfaNt7gF9FSnT+iJaheU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3H7B0CPZoxAhSAA--.26000S3;
	Mon, 20 Oct 2025 18:01:27 +0800 (CST)
Date: Mon, 20 Oct 2025 18:01:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 5/5] arm64: dts: imx94: add DDR Perf Monitor node
Message-ID: <aPYIdGPhr81i2w2F@dragon>
References: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com>
 <20250821-imx94-ddr-pmu-v2-5-052c6420605d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-imx94-ddr-pmu-v2-5-052c6420605d@nxp.com>
X-CM-TRANSID: M88vCgD3H7B0CPZoxAhSAA--.26000S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7zuWDUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhf2XGj2CHfydwAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030233_729286_EF618B43 
X-CRM114-Status: UNSURE (   7.32  )
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

On Thu, Aug 21, 2025 at 07:01:53PM +0800, Xu Yang wrote:
> Add DDR Perf Monitor for i.MX94.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!


