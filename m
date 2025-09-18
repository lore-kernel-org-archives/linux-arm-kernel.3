Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3E3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 22:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cuu8G6JZ7qp8ayQBOP2HdvIo8j/hcslogM28UmpOiNY=; b=gXY4EfSWq+ZqK2eN/3jgPDqJQ7
	T/myqbMoEjZ+2GKdJyEhDL5AV3X9up6MGhNMfffkf5q+/UMwhs/2LVwiUaiiiIMVn4TacFQlI7stK
	ElwiTvA3NmASvR5BNhOjce9YCYSjTuSAMofhyUoISmn630Gd63F1PbKSuXstcUem1jr1RZUr4D5LD
	CH4T3hCQoJEaRKa5viHgKxSKdL3K4tNwSBc6GlplJjbYbtwG2+yrbbEym75P7/mA7ecRsa6hpabDc
	Qegjjr+T3ixKZu8hs4rGp9vwekHDc7rkV03aJVSOrW1DUyjaYjkX7imAp1qGsWBjw5Nw9udQCXh6F
	ITDH+Aow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNZo-00000001N11-1bML;
	Thu, 18 Sep 2025 22:58:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNZn-00000001N0t-1q0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 22:58:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8126960217;
	Thu, 18 Sep 2025 22:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D156C4CEE7;
	Thu, 18 Sep 2025 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758236286;
	bh=IwmXQQCVEyFCcqnTQv9hOH6WRK5TuVwGwxOpabm5eCs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W3Qfwpfe8SycJQfDHEZpE6tEGSa8k2u7zXEUEzrCm9v21w88sQvt/Lo2N7t4F9iWb
	 koShJk5GZu/BaHR6H29HX7ASnSkEnRX7f9ycACl6bNIcHoE4TwSpfJNpvxqwFDAqMZ
	 xeUr0JCbh3J9cBOutHaE+yJ76y+bNiqufA79wLoDbX2sAlG6of/g6iq0a7aczeDjqj
	 bYRtysYZfmj06jv/2VpkR8K88w5TUyVuQdKWZkp/zTYqyvTvTixpt4OkgU7EpO09DD
	 l6iSIhPdj3N9CHwdvq5HTartNnNZD6rpfAvpg1oYRLGuWUxqxtpD0GmBaLzdZ5AncN
	 t7g/k1wFf5X1A==
Date: Thu, 18 Sep 2025 15:58:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <michal.simek@amd.com>, <sean.anderson@linux.dev>,
 <radhey.shyam.pandey@amd.com>, <horms@kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <harini.katakam@amd.com>
Subject: Re: [PATCH net-next V2] net: xilinx: axienet: Fix kernel-doc
 warning for axienet_free_tx_chain return value
Message-ID: <20250918155804.26fb6ebd@kernel.org>
In-Reply-To: <20250917124948.226536-1-suraj.gupta2@amd.com>
References: <20250917124948.226536-1-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 17 Sep 2025 18:19:48 +0530 Suraj Gupta wrote:
> Fixes below kernel-doc warning:
> warning: No description found for return value of 'axienet_free_tx_chain'

There are 4 warnings of this type in the file, could you fix all of
them in one patch?
-- 
pw-bot: cr

