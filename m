Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEFAC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoMJHBpWMu0PfFPXdOpXqsF4rsLE9nT+684D4CStTqo=; b=bYjWJgQnooro1TlYY6O2ujRARl
	Xb+29BsDXVtOXrntkJQwehQcMU0lcAUKalt7T0OICtZUjAgeoO5pbsR8cBxhyLvBoCCLuRflDcr++
	qJcFxeVZrTPvXwrXzvlaLQgDzzn3lhRHz85i0RqX0SARW/8Jc3n6MTTI0Z0+030bDw8FOQRV8IP8b
	UZmiLRU2FYoAOmxklsEpOAPm6sKowFjJgyqn/mbkBC4+6/CTYfR4lQczuRPO7sk85bfi2b325GTsD
	e0yNfOtjaobvodpc3iZmWj97dTbrd+On3MAFtWQyITjDnNoSbbr57PpZuAc7dfBTI9VIj7hOd6fpV
	hKC6Ak4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8b-000000085e2-3Nnk;
	Tue, 22 Apr 2025 18:14:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Eu7-00000007Z1S-48FC;
	Tue, 22 Apr 2025 14:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8C6D5C4CB7;
	Tue, 22 Apr 2025 14:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DF7C4CEE9;
	Tue, 22 Apr 2025 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745333237;
	bh=FoMJHBpWMu0PfFPXdOpXqsF4rsLE9nT+684D4CStTqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KDZHAg/vxSCs1SDn+fai6JVXrLIRdQ0usnl9Vqa5ZmduLJ7JUNOzfi9eVthE8v41f
	 XvsTO574pkxOVt7857ozBxJ2V4eCmwN/seI/sDnXYyor9O4J5xtT/BapgvLbjqAmeS
	 78ZvgvrKdoc0lbm1lJEmJvXeNMSkel6HXiCIferTFkTz7BqIRjfBPYz3TZi4ecKWfH
	 hOld6pXH5OsT7QF/jJQQN7SYdHHhU4CXIjyEbaUXFnlDb07Bq70JexyUhlCZ/5aK2q
	 WfrM+Dhthfsj1X3vyDzVEQiSNCNid4TrxMBrxZ71Wq8YxqrUX05IDydRM//5HJ6JPG
	 1WqaUn/HAYuHQ==
Date: Tue, 22 Apr 2025 07:47:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, Simon Horman
 <horms@kernel.org>
Subject: Re: [PATCH net-next v2] net: airoha: Add missing filed to
 ppe_mbox_data struct
Message-ID: <20250422074716.2ddd4320@kernel.org>
In-Reply-To: <aAeiYFIIOyTVvMhw@lore-desk>
References: <20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org>
	<20250421183610.7bad877c@kernel.org>
	<aAeiYFIIOyTVvMhw@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_074720_084847_ECFB1866 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, 22 Apr 2025 16:06:24 +0200 Lorenzo Bianconi wrote:
> actually the commit below is even present in the net tree. Since this is
> required to work with the official airoha firmware, I guess I should repost
> targeting net with the same Fixes tag. Agree?

Agree! I must have mis-grep'ed it

