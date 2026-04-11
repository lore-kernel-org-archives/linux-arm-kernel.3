Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18327F3ED5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 23:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8Dijh49ySak0udWaZwVN0byEHGWibBZm03pBKfgr0E=; b=bXA5awohX5UlGA50/vdrlTnave
	gm9SinVy8w36cfVBGZeaUdoAePdTWQhJWGwrxl0tzfBuUTnf6F5Vn9g+zoCklzWiLCt/DObS1i2nI
	RP1/nvzNI55tLkUooGHc2uGavFqGlWw2ZU+gAWQlaGDRK4HZz0AW2KruaSQoUwgdEKlKOvsGkTftl
	e28FzS/N28i2L9+IMt/Ky7VnhI0BUcfItSlhzyl/NVVME2gvR825RCDLLXf+B+j7OtgoJx0j3vBUS
	t0/Lu0P3FOrJp7WM9oDBrvyfkR4Jaz3mXBndUg7wQ8BxvucmwYQikM688XsziiYDfAtHLt0Br0mAS
	ex7dgTHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhfo-0000000Ds0x-1rth;
	Sat, 11 Apr 2026 23:23:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhfn-0000000Ds0j-1Www
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 23:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD5826111A;
	Sat, 11 Apr 2026 23:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C66C116C6;
	Sat, 11 Apr 2026 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949779;
	bh=oroHxUHClPYUz4m0h5zu5EEP5ijWju07lGzziFBaADw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bUF5W2IQppSSBZ++1XBpRjQ+M0iWcqCAalWKya2cuCEqB5mmlSlIerJ9LUyXy8hFA
	 DrdmwfiTSBOteXRYfv+KOhLAh/aYe/s2c8VURHV8ko2In9zgwxLtsp6TJx2mn8vCld
	 RrY8vq27kGvX1CPtUDSi6rnmpzblrpY9ip6w3g+V4y3YnzlJadyfPsvITXu5W7ci/T
	 UIIAmPuilaTAz3EetJqyg62iprt56EKIgEFPQqaVT6pWzXknWKu7b1U9sZde+lXCMt
	 4EJ48vMdA7abpxkJJdg1tX9yXY+0bQ8hid6TCAkEAHLSMY67bKvC/s6YukdJoea+dm
	 z/nWovg5Ucmqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260326134515.67326-1-andersson@kernel.org>
References: <20260326134515.67326-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fix for v7.0
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 16:22:57 -0700
Message-ID: <177594977765.5403.8286169436542730631@lazor>
User-Agent: alot/0.12
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

Quoting Bjorn Andersson (2026-03-26 06:45:15)
>=20
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.0
>=20
> for you to fetch changes up to 141af1be817c42c7f1e1605348d4b1983d319bea:
>=20
>   clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source (2026=
-02-23 10:45:35 -0600)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

