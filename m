Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDxLsxVfkbLQRPgtf4a2DPhGbS7uctNKj95MDtbkTX0=; b=Y50Aka/blzhj3Mmt4hoYwjGvcV
	TCOdy7kYcN1WA/GNmKWyvDSvWzWB+aNDlvteZozcs4Uhkjjz++X6HPnFJZ7LqzvaJKb6gnigwoQGU
	IGD60z8v8S+obepksbBf5M3ku5zZGo4oFTYyMNtzz5cLILs+25nFM2DA77wpAGSf4eUXlS+qHwJkm
	sw60OJog06Lv4NRMUVMpWGNPr01EchgvWGaC8dLhZVhsMpeOYHOjj3v43vkNGsHwAR8mLN5+47Zvq
	yhfj43y5DxuGom0RHUYdQDC06oPV5OdFLZmGv9kuEiLag9VOM/wH4cPwxvc/aRAyCd5VXyqkDhsv/
	V1oiRepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehzi-00000000MTN-2Ikc;
	Tue, 30 Jun 2026 23:35:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wehze-00000000MTE-46lu;
	Tue, 30 Jun 2026 23:35:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5883D40958;
	Tue, 30 Jun 2026 23:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01571F00A3D;
	Tue, 30 Jun 2026 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782862554;
	bh=CDxLsxVfkbLQRPgtf4a2DPhGbS7uctNKj95MDtbkTX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YHeE4Nt4OYOz2we9Rp9rScfov5rGKj3gUpPEQFQ8IPMUjRv7Ci6rx8zn734AAIN+r
	 yOPDSFZrif2MwowNRiJ1xB+vcjdRqZrxsM1s26sxRv2d+8IKqsVhBjnjziINO57VvS
	 CPuJNT+8vmSL3ru7a/7L3UqTpXAfodL6EG47/lMZuW35zNZ/8UKIHNr6gIuqphMO0s
	 wgWU5/5lmlS+l25UuTkTQR6V2CQSRyA/bPybolc7NI6q3JKK+ftnYZcOTLw9zaK6EF
	 w3fGM/0zc09wzSI2Nl0wFYIJ7+B1ryfN+TkKReZFWJQ4wkgmqYEIJX3OR0UARvCZ40
	 HRGYXgV8uPdcQ==
From: Namhyung Kim <namhyung@kernel.org>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
 Chun-Tse Shao <ctshao@google.com>
Cc: alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
 irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
 afaerber@suse.de, mani@kernel.org, dapeng1.mi@linux.intel.com, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org
In-Reply-To: <20260609215046.2391903-1-ctshao@google.com>
References: <20260609215046.2391903-1-ctshao@google.com>
Subject: Re: [PATCH v1 0/6] perf vendor events intel: update
Message-Id: <178286255381.2863034.8189687610180090122.b4-ty@kernel.org>
Date: Tue, 30 Jun 2026 16:35:53 -0700
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

On Tue, 09 Jun 2026 14:50:39 -0700, Chun-Tse Shao wrote:
> Sync with the latest perfmon events from:
> https://github.com/intel/perfmon
> by running the script:
> https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
> and copying the resulting json and mapfile.csv changes into the perf
> tree.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



