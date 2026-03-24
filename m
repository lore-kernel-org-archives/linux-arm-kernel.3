Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DCA109C04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieyys86Lw+s8t8PBuWjxgVxLKn7qxRBmZKOwU1pL/RE=; b=cnI4420+tfLP4CbEW0+AlcPtYu
	udoOMYvmA0IsaZhUie4nOANELE//JXO2pTWDCb9S3Tii03YoW9C+Qw84YHlX3JdBaSjaZUkW54aQz
	B8knEkZgMKfa1Pkn1iqo+p29V9HUbwF6C0SpSLWp7LbD5uMONezYk8g4f2Xo0lGqVeV1sbXoeLUGD
	Pvlqw0YP/OWwtyB/UZAYBUn+bYPHbg/uUIb1rhEZt8uuKfVp88qFzJFmfZv7OOSSfj2FjmbcIbYpG
	Ms+1/ktqyWlhDbLKterxBSB/iFqgmsglNjKUgFTKFS6+OCaMR07RnHrdhESmo9eZtZz9oqtCGqlrN
	HNHVJ2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5T0p-000000044yU-04j4;
	Wed, 25 Mar 2026 18:31:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5T0k-000000044y8-2bhE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8AE2434CC;
	Wed, 25 Mar 2026 18:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836C3C4CEF7;
	Wed, 25 Mar 2026 18:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774463481;
	bh=sAz0MAIKMLTbWGidLLMrJJWq6WztNTHg48T12Bx+yU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P1VdO3r5Vs8SJukiho+q+GQ766Lv+ZygGmw45zOlDArmvLNQxPaIumlx9G9V+D9F7
	 aYAG+HKCk6ip8tb+b1t2yeenhb8jIA4LdXd0i6A4K7gEK9MyrcY0kqCUaZCpNHzJ5e
	 zLCKkegVqQmWQaOEkU9BnIqTvSNyRjg8vrilY1QJxXic3JbvPwb53OsxgX9+e5lZIe
	 KiN+3pOtercyEcJOMdi0hkVxLWOJvaW/iW7GYtYcBQgAV9db/RIstVoRKT21bFZ0x4
	 xN78q86g1oxo40stxwKAytjXcWrWZC2FHC6+S4mTMI+wPE3JkQey5t5K/uQvMDKZol
	 fZPtHKUEL1PYQ==
From: Mark Brown <broonie@kernel.org>
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg, 
 ratnadiraw@smu.edu.sg
In-Reply-To: <20260321105945.8224-1-kexinsun@smail.nju.edu.cn>
References: <20260321105945.8224-1-kexinsun@smail.nju.edu.cn>
Subject: Re: [PATCH] spi: pxa2xx: update outdated reference to
 pump_transfers()
Message-Id: <177438213638.322033.8740503029303656760.b4-ty@b4>
Date: Tue, 24 Mar 2026 19:55:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sAz0MAIKMLTbWGidLLMrJJWq6WztNTHg48T12Bx+yU4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxCn2gThbBxhfKPHDgYO9ryJAQqHKDEEWV9FXg
 RUUOkEPd36JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacQp9gAKCRAk1otyXVSH
 0OYSB/4s/d+tKEk2AO815MKrfRV77dNl1UsT85r6iwVyDbRlUFST3AchwLhdEeyY5FZp/g2o6Do
 c8ktOLwWgP5hr0+6aWSfXdvyW6h4HTFotzaLj0uazrbpL8DpIR6cT4KIR2icF40Nkq8qhJdjyFE
 Zm3QStrQmL2MdfPqmVkApd/nepfCvj1IyYQsDRxXQZUQCedxK8RWbm/AL+Ajpsl1mdF9YaaOXLZ
 mI4vHBpgBgCVbvZvRfrATc50Q3jn7IKra6ECZY+5DF13OCrHo0Gkm0SFzL2kwry4XH8yZGOI0Bi
 4C9jmcDq4yGFJeU5fMtHDUkgR+iCr+8fgNMgyy/YLUnzqMeZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_113122_707577_EBD26460 
X-CRM114-Status: UNSURE (   9.83  )
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

On Sat, 21 Mar 2026 18:59:45 +0800, Kexin Sun wrote:
> spi: pxa2xx: update outdated reference to pump_transfers()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: pxa2xx: update outdated reference to pump_transfers()
      https://git.kernel.org/broonie/spi/c/762a3847a05c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


