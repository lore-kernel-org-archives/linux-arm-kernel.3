Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9F3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMDqsAh1jU5CYCw9h8XE08Fwd7BBF3kyocEWcYHH+O4=; b=xVqoTIbCRD65Zbj+qBdE/vPpKn
	43CQLuGivGgVmq1hIytei6IkD8j4ltQNSM82l7oZfYoJsh1IWdTisXDQzbGHGEh2vpw9Zo5BqvJWu
	ge8Df4bqNs4Xy6frvM68LjSiH52bWMLHWKNxcTtk4P2Q+CoFenOHgnnu3UF+dQwh4VQo3GA9rfTP0
	TyfXwWWLyyQjwWKpOi/q4+hWIXdOaO1hFJV79ykHqByrBLjP1jMDgPqQDqp+Tn8IeuPyR9/j6J2Vv
	//0SMcOfRCcnrDLkrAGfMiXiUVJcS+kwNPDxfjpr4E7S1gk4puohGfl+4Rfhwybz6/92rXGRexx8U
	CXLXbzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFykN-0000000ARZA-3lSb;
	Mon, 03 Nov 2025 17:53:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFykM-0000000ARZ4-44z5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 119E96013F;
	Mon,  3 Nov 2025 17:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E229C4CEE7;
	Mon,  3 Nov 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762192417;
	bh=WKTjpwgdZc3cxdwKgcdKRaYPplrOrb0jsdB/8pSWLOk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gGDuCE3/Kiy3DwPOLJvENYr5wtqN+IcPpFJ2Yf+j1l/pGTPWhh07g1aMC5/UIlfF5
	 PJdU9E3xKvY8Jkk+ORovBaJZoP0bbyiWNHgSNAtObcv5I+ngHhxcRV3BthTqBwgSbu
	 ah1UWHO1tfT+J3dRfwAM4pdIn/NEpLPBrxeoT1B0jhybhgM14whgnpSFz0zforMfjl
	 n7zVxOwZ5XpLIpjDEDvc5pLwHdhdUxoHjw95AQ3bpT/k+QDyZ4FGiRv35MfDQJi4R4
	 TcX0/atI97engX0kOLDZ5Av+K6c4DKgO/XUjc3FX54uB00TM3sKQg+J75CawFS3hzf
	 w0O4Va9uBXV2w==
From: Namhyung Kim <namhyung@kernel.org>
To: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
 mike.leach@linaro.org, leo.yan@linux.dev, peterz@infradead.org, 
 mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
 adrian.hunter@intel.com, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chu Guangqing <chuguangqing@inspur.com>
In-Reply-To: <20251031031729.2304-1-chuguangqing@inspur.com>
References: <20251031031729.2304-1-chuguangqing@inspur.com>
Subject: Re: [PATCH] tools: Fix typo error in json file
Message-Id: <176219241594.1981113.4886974099305905411.b4-ty@kernel.org>
Date: Mon, 03 Nov 2025 09:53:35 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
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

On Fri, 31 Oct 2025 11:17:29 +0800, Chu Guangqing wrote:
> Correct instruction spelling errors.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



