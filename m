Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9241CD2629E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahWpL4AxAAFKClR1P2NiVVIZDR1uwCax39nbX8Jtzzg=; b=nCl2rHhJEg8cVNk4io6K7cZAHH
	diCX+TW+XrgOL7O8/7wCDmc0ca0Cup761ZItN1yrl7KIiTdlhIw1Dl/dZzzytkT+xG43bkMZftF+L
	AE5G/hD+xBd146Sh9qw4ex91MqBGE+P42PPe1TNyxGVwli+V6igr5M5nu6U9CbijxmxhwSTLguivH
	cQcZtO0a5nXauBiyugAsL4hMYKBaXzlHxOnquA0rVjpBGpJVY55P79pNYZSX6fd9bdUrqzgR21Xwb
	NgcK77Vw4MQOpOAZgoTX+1n9cz4R97R3FSnN1v623yyo4QKLpl6c7pKVUQKWhLSF4TAkRhLbRezQo
	eEbLJNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIOY-00000004RLe-3XN9;
	Tue, 20 Jan 2026 20:32:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viIOW-00000004RL8-0tSR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 20:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87E4343A8B;
	Tue, 20 Jan 2026 20:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6E9C16AAE;
	Tue, 20 Jan 2026 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768941127;
	bh=1zg+J5kv/yyUUj0j+F868PF9rK/lTAe42LH5TP4orTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urG4pxoD7GXbtxH0vY9qt6kESSzA32rnQjqIfKdNLxeJKrE7jf6NMwrI03qCj527D
	 6sZST++kf+c6Kjr1kxyceN72u3znyGnafp27lAcQ6SDCCD98IzW0wKlypvJoDLfTVk
	 AuDr2hqSmBWnzTXvavn5GgLwhXEmqP+jcB1pivNir4AKYawMBvO905aJS96V6pQrLK
	 6I18lxK9D381ltvvU441D4oy9qEny2xm0kX6F0Q6+Nk1nJZ8GDdughOFk8EXobCzJz
	 iOLFoPJSEXtev/8oMCvnupT18wxHMYh0twMgICtZOPG5EwQlQW2Y/U7EwSmW2p/0vn
	 hwVFzDUYd0AxQ==
Date: Tue, 20 Jan 2026 17:32:04 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Mike Leach <mike.leach@linaro.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>
Subject: Re: [PATCH v2 2/2] perf c2c: Update documentation for adding memory
 event table
Message-ID: <aW_mRD7W7QkAE3Lw@x1>
References: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
 <20251212-perf_c2c_update_event-v2-2-27df9a6cb1d4@arm.com>
 <651e1a79-356f-4f86-a6c3-8119f1c6c98f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <651e1a79-356f-4f86-a6c3-8119f1c6c98f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_123208_286785_57E8B6A8 
X-CRM114-Status: GOOD (  12.74  )
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

On Mon, Dec 15, 2025 at 10:40:04AM +0200, James Clark wrote:
> On 12/12/2025 19:25, Leo Yan wrote:
> > Users may occasionally need to see which options are applied to memory
> > events.  This helps to understand the behavior of "perf c2c" and
> > "perf mem", and provides guidance for configuring memory event options
> > directly.
> > 
> > Add a table to track memory events and their corresponding options, and
> > include the Arm SPE events in it.
> > 
> > Suggested-by: Al Grant <al.grant@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Reviewed-by: James Clark <james.clark@linaro.org>

Thanks, applied to perf-tools-next,

- Arnaldo

