Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCA3CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9T1aihntidZljr34HDw/hIULFopJrt+Z1joPKFnXEaM=; b=fKUQQuN8Pb7yCm3LoFWwXPN6LG
	CsQCGNO5Fvr1Q1mgAQiySQmibxhmoxFxaxiCeA0TcpBiJVhXu9gk26CBhQPDc65/sCSYGUwZoVLpC
	QAXng272WvUe0gb+krH9GQZXidyYsqKYsrpzBIS3cgQwYCfhTxcWHIsMrnCerdpKRienfMALehlnR
	nNT9AmXoZxLteB30A+FzO4jBA2At+OB6gcdRPZZsypLUD76gZO3eaqJKFPvgriNP6u+LfzQGjhTBg
	L+Hh+XnIPV0nOVwDzGVB0Cok0zKkYaawUsOXYturJ/9PZWl8S5oE+71L5nGxQAqhbiUDldly466Wy
	V+FXdhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5Ft-0000000GZaS-3NKf;
	Thu, 04 Jun 2026 10:24:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5Fs-0000000GZaF-2I7Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:24:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05E6F60228;
	Thu,  4 Jun 2026 10:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025381F00893;
	Thu,  4 Jun 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780568691;
	bh=9T1aihntidZljr34HDw/hIULFopJrt+Z1joPKFnXEaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QElofj1SOIeab/SKpIaqUUxs6uDMPVQ5dljMNgVGOMkK7pHKbxcCQwiidDNnmvSpY
	 VT/4ll6IDM4WFhBK8Y7LERc8KH+4qIly6/g26qu1A5NUrK4EHuXRMkHGtKIjkgWLUh
	 swl4e9psPUsC5lYaQmyVRnu0LqtHEXIYYHXMcCvZftRU+2R1oPXKkNWzQEOlZ4eCCG
	 ub8OpTEVvcypJtV82bp5caktDtdoUaEVNOaVyGMizLboBntDu+5OJGXCB844W9uXDq
	 8ZLKzXAxp+ZgjjuDUYOQtC3PeDeio8NkKH22MOoE1C9VWxfSIe7DjdvWuq1CexsZfG
	 0pJVKXe8D4SYQ==
Date: Thu, 4 Jun 2026 15:54:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <aiFScCW_NEY3CsEf@vaman>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
 <ah8G_ajPS1KhgPP_@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8G_ajPS1KhgPP_@linaro.org>
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

On 02-06-26, 18:38, Stephan Gerhold wrote:
> On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> > I feel like I fell into the trap of trying to address pre-existing
> > issues reported by sashiko and in the process provoking more reports so
> > let this be the last iteration where I do this. Vinod can we get this
> > queued for v7.2 now and iron out any previously existing problems in
> > tree?
> 
> Thanks a lot for working on fixing all these issues!
> 
> I agree there is no point addressing all the "pre-existing issues"
> pointed out by Sashiko, but have you looked through the other comments
> for new issues pointed out for your patches?

I hope Bart and Qualcomm can fix these driver issues as well
> 
> Out of curiosity, I was looking a bit at the comments for [PATCH v19
> 06/14] dmaengine: qcom: bam_dma: add support for BAM locking [1]. There
> are 8 open comments there (Critical: 1, High: 6 and Medium: 1). From a
> quick look I would say most of these could be valid. The critical one
> about the usage of dma_cookie_assign() sounds a bit concerning to me, if
> it is true we would be basically breaking parts of the dmaengine API for
> consumers by inserting the lock descriptor in front of everything else.

Yes this seems to be a valid one. Attaching another descriptor for lock
does not sound right to me, as in this case causes descriptor to be
marked 'done' prematurely.

Honestly, I am not quite happy with the way lock is being handled here.
I would hope we can have some better suggestions. Adding a descriptor
for lock does not look right to me. We are adding odd hardware/firmware
behaviour on engine apis.

I had earlier suggested to lock always or lock only for hw/sw versions
supported inside the driver, that might be simplist solution without the
complexity added here

-- 
~Vinod

