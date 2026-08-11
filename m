Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DE1C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsWpeSk2m/ZsJbPa2XXGpAyKfVq38tCEkqKhuR7aSUc=; b=i8RMc96WPlCb3SY+O95DS65K9v
	wuY/WSavjbfP51DFo6enZ8gy1XIKDcZQz2XnVoeTCWJEsOFUe0tm+wwkFGU77/gq5NPSFeSMB9Cz+
	YfA77uj9vJMBu3Satzc9Shhd8pIqz1QwQHjoFqf+fQQtaE31BE9DnVQACfaA6phocMBuVzkAVyHTi
	WkGtJpWaKVd7lgRFg7eXGyo4KBqaQwYmdhVgYPGkItbJ18/PHdwjFj0o/a0gGTEmmvT3JRRFmk8BZ
	be/UIobPi5WWPnTB90Ogu9wpKXylMtyoPMmVEtZyBKMxD+Y1DAAIsWWxVV/wGChIYTVQeVeJsEk9B
	U8R+dfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqEE-0000000EdsT-2xM9;
	Tue, 11 Aug 2026 17:25:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtqE5-0000000EdkP-2HD0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 17:25:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16C31477;
	Tue, 11 Aug 2026 10:25:15 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D1973F632;
	Tue, 11 Aug 2026 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786469119; bh=fr1a0mTx5esZDwVp945mOEtEBnRbo3yPEGgNZXt/qKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQjEYgqg7lgSm7xoQRdLO/Pql+DznHBqN+A13y5Rb7I36DX+5o9aIF68G7M0siXl4
	 Rft4dJ5aaZsoxxtHYBG2YqOdb6joHw5hl/QM8z1cUO3msRSjtDHHcdv7O5nvU2+g64
	 lTmszU+BuHJfmU4sGhy6Xj+6BZ5Z7HdYK8vFqD6U=
Date: Tue, 11 Aug 2026 18:25:17 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 11/13] coresight: etm4x: remove s_ex_level from config
Message-ID: <20260811172517.GI15499@e132581.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-12-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725113645.57519-12-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_102521_628805_560C8F5C 
X-CRM114-Status: UNSURE (   7.89  )
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

On Sat, Jul 25, 2026 at 12:36:43PM +0100, Yeoreum Yun wrote:

[...]

> -static u64 etm4_get_access_type(struct etmv4_config *config)
> +static u64 etm4_get_access_type(struct etmv4_config *config,
> +				const struct etmv4_caps *caps)
>  {

Is it possible to retrieve drvdata from config? Something like:

  drvdata = etm4_get_drvdata_from_config(config);

If this is feasible, we wouldn't need to modify so many functions to
add the *caps argument.

