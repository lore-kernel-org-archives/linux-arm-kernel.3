Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F6BD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 18:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmkt11QuSkX4c4d17mTrKjBIiTeDzZwQaFCLL8YObWw=; b=cJ80nPys/TmNJjBt4wAD/pmLoV
	w1Uc7LpW5dEfYn+5sKOULjCdOJneaP/Qes/I/WeQsBDhlB28GCY35wzB/3dj7rNnkYFvZC9FZDfod
	kEnqFl6W3NUndIfWGnbsjcbhxOJdWvNOeCQ4BXWp5+Io3ljWrWx5lkLNG6slWXh6+QRpttLsaSR1i
	MC3jYL/mVvUoiytA8UgpUusajwrzjoSuuD49Imtta6P2KmWMiIFWhvML4p9oPTXS8ys24TtznubT8
	awZWa9HIe2wn4+rRn+dUDv7MxWoCIf14QpiPO08WF53fJI1Ox4W6higiFhFbjeJa1wubjM+BB1IIB
	msVw5+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Ym-00000000nWH-2YNe;
	Fri, 28 Nov 2025 18:51:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Yg-00000000nUG-1XUf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 18:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71DA160197;
	Fri, 28 Nov 2025 18:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8122C113D0;
	Fri, 28 Nov 2025 18:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764355865;
	bh=dhHIbvpCuulxKEAkqdhlFDieD4aHu6LWLRet+FMiD5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mh5TT6nqG7GLwKm/V8ednxHY2PajJrlW7e1XAzHhABnJJ7XufHgJOx+vtzS6j1MZX
	 BCoQfC9V4raW224VY6nU5sVwFM+B3KePmpxtWIXKQ6Lz+onuAb8Y1qhs0phPIlWcdg
	 eEpcSzxwO+cgN/wZ4zsTh1Z7RwJ6aLyKB5KQmHNMkx89BEo19YFBI4BytJO9RL+61X
	 0NkFHfNtN8xAW1Xqa8rpwo4jfSCbuJbroINDXPly7NaYJNwxs5UxVVO4+gH46sNA3j
	 Sj/8V9F61pnEqq31jdj2+X3GTHmQHM/dkfygwI+Cywkl/LbrXInEkSppT+lDHP9QcB
	 jDP+Wxg6QGeMQ==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>
Cc: Oliver Upton <oupton@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] KVM: arm64: Fix spelling mistake "Unexpeced" -> "Unexpected"
Date: Fri, 28 Nov 2025 10:51:01 -0800
Message-ID: <176435583511.14290.101174161990641158.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251128175124.319094-1-colin.i.king@gmail.com>
References: <20251128175124.319094-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 28 Nov 2025 17:51:24 +0000, Colin Ian King wrote:
> There is a spelling mistake in a TEST_FAIL message. Fix it.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Fix spelling mistake "Unexpeced" -> "Unexpected"
      https://git.kernel.org/kvmarm/kvmarm/c/f3ec2787803e

--
Best,
Oliver

