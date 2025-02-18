Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FA0C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw8VUAUqd1LTDPrqZW2pq0bIjio3+TrURyjC/H9+pJ0=; b=yN9N8b/2vtpGkGMZb4hpb4q5Dc
	punavrYtbcXV6v+4DDqf89AzgoMPAHZQoDK+kgzGZxtKtupL5TMq15ItoExYoSBKk0cuSZcdlnEZW
	9uxvbbOMJpIZvR1Vkhrh3xXzIPUsRVv+BR6w68beje6/u6gkkO2WV890eOjoUJx3pixKopwrdUPFl
	W51MIfiaNhlKedWK+cfsJtUPTLVZHLDk7Mda7PX4WZWarz+8iQX8gmrJlyRMuozjXMSj4abdjxgCw
	JPAMDr5y8RmOnUiAx+xo0MAwLrzzGV+uk7K6w5wbQ0IQ2XfUBD77XK560FaQ+8KTVJCQaFA6WFNuG
	ViY49WiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIyL-00000007Hk6-0RZZ;
	Tue, 18 Feb 2025 08:28:53 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIvu-00000007Gow-2uJl;
	Tue, 18 Feb 2025 08:26:22 +0000
Date: Tue, 18 Feb 2025 00:26:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
	kees@kernel.org, linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
	pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Subject: Re: [RFC][PATCH 07/10] printk: export symbols for buffer address and
 length functions
Message-ID: <Z7RELnyWRLietj9b@infradead.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <20250217101706.2104498-8-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217101706.2104498-8-eugen.hristev@linaro.org>
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

On Mon, Feb 17, 2025 at 12:17:03PM +0200, Eugen Hristev wrote:
> log_buf_addr_get() and log_buf_len_get() can be reused in another module,
> export the symbols.

Err, no way.


