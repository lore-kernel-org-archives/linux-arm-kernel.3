Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2338DCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bH06isx1aQbxqcwZzqmRVDLI7BxXRb8RWhUr5jAjKk0=; b=vZ3OuvMVTxwTUPTbjhq4iWnS5d
	H1SXWEYTix12AQMf68kUuY2TJx0zlxcuW140GsUgXBXfQx37wN3LkO9Ib8Ytf1JVVTJBbVguD/3Xe
	+oXLU0e2Rfsh/+ovyDXs8tXcMK4m2/twBECn1hGrGjq9K7S80ZOru0oT0ITS62wNyFtok49uhpRBW
	2aB5fu+QMH9DUL7YT+jxSv7FD030okRqg3SmWDCRf5tfBalvMXndCnm2AMR9Cuzyf5x66OO2HfGlu
	os3Q4DrihUxsqw0DA91YRnKYv7gmr40Z46xIhwm/A3xwpEJLtGdYpZdoSjWq2yg6vzYiCi3pMZuhS
	Y+2IzEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFykR-0000000ARaX-0jfK;
	Mon, 03 Nov 2025 17:53:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFykP-0000000ARZD-0917
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D44B143D12;
	Mon,  3 Nov 2025 17:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0960DC4CEF8;
	Mon,  3 Nov 2025 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762192419;
	bh=B6HA5JHab285szoGPrmV08KkVodoiomSuzjYOmmg2Mo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ugVLZ9utCYOROBrZEzTkhyAyTOygjfo8Sa2xIhf848IWfpjrk5UOET2nK0qwmqs7P
	 39Cxq1uIgAeZCmJ1OtkK+IFfno42aR6BTKGourrGdxTVF9aOB/zMFR4+os/AtaA0aY
	 qOkq+h77cqq1YzVY58nJhY9iptMOuR79nS3Cdn01DtYyz6X22nw2tnq8HQEckA4WZo
	 4QhDyp7eDEx8ROHkROAn1IEXjk+V6WnyUFf5SdZ+BohqY5qBlR/ptJzg0AcF/52fAm
	 R9Y6io3erKHvhN4l6l6Xh09YCDLUUjHmAlVaRzNV2/NHw0DnkgM3zmHnZ4H0BHlLtF
	 5XTkcjUPbDLZQ==
From: Namhyung Kim <namhyung@kernel.org>
To: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
 mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org, 
 mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
 adrian.hunter@intel.com, Chu Guangqing <chuguangqing@inspur.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031025810.1939-1-chuguangqing@inspur.com>
References: <20251031025810.1939-1-chuguangqing@inspur.com>
Subject: Re: [PATCH] tools/perf: Fix spelling typo in tools/perf
Message-Id: <176219241792.1981113.11259694357369931202.b4-ty@kernel.org>
Date: Mon, 03 Nov 2025 09:53:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_095341_124000_BD49EDD7 
X-CRM114-Status: UNSURE (   4.99  )
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

On Fri, 31 Oct 2025 10:58:10 +0800, Chu Guangqing wrote:
> The json file incorrectly used "acceses" instead of "accesses".
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



