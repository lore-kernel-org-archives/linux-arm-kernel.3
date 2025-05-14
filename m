Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF3FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y81iAgyiKMhMJStgAM3Qcdb+VOU3OBMQu6oTTeFv0zo=; b=4y/9mVAyG96VNiSf8hZNgaEjxE
	RYRDnxiqjaXbs9A1DGRcdxavrLP8znxl6D1DgtV/7aiLx92kpGdALKh3GyirDXSLolqEgXYa/FOwc
	lbKwQgZwCu3m9tHH8KjYfoVIWgaJgdsZaHeVQ3dR9yi2nV3077y+dOQBCcuhgWJeXDvYooLzv/hoz
	lXKkUb55bdDhWlswHe1VQPIWiqU1otwjDMz7henR7TTk4yWsBgv/z9UWSdMgdrgI3hQ7sQCBo5ghA
	bhBZDux9Aqk+Vwwaw6c9Je2WyuaBWznxWG0mkCNxjZhh4DxO2i82WXQ9QgRt81SVLjQ3sMN2rZlXW
	4MExtTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDg-0000000G5fQ-33Vj;
	Wed, 14 May 2025 18:52:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGq7-0000000G1eG-16M7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 18:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF6EB629DA;
	Wed, 14 May 2025 18:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CECC4CEE3;
	Wed, 14 May 2025 18:28:20 +0000 (UTC)
Date: Wed, 14 May 2025 14:28:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/24] Tracefs support for pKVM
Message-ID: <20250514142847.50a47e05@gandalf.local.home>
In-Reply-To: <aCTdUQRPjyhpYnmh@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
	<20250514133815.78bc2599@gandalf.local.home>
	<aCTdUQRPjyhpYnmh@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Wed, 14 May 2025 19:13:37 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> I probably can send a v5 this week if you wish, unless you prefer to wait a bit
> more for more comments?

Feel free to send them this week, but I'll be on PTO starting tonight, so I
won't look at them until Tuesday.

-- Steve

