Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAEAE8783A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o773KLsK+zy8V9i073J0ACbDuPhRkDc53dgX61AGC+k=; b=IaYGLdhVUq9eQQ82fu0qGxT+l2
	V/2K8IgGAkgL52IQixTKmRcNf5II6Sswgz8b7g2Et4H7nDlWl3Uh40yoSPkEY4OkGnPrrmaHnrxbH
	8wrw0dx+IjVSop6+YIMZn5YiFJhOHxsk8LE7DlCY2e2MR++dtANVgnYHvqRi1+iXK6kYTyVw3Bhuu
	/14V5Ax8NyHcX9WNOhpAILaG/BcZEZZQRCdIXadOWGn8jZY9x+7G1a+i+sfl4dhrXD3z1f2LSYhx5
	fIwAE6/ibjhG7XvGvo6Hx2TxDSFMGcNzpSlwrF9A3E4j8WDbO7XmwKmmKFxIvj44uC1AiWxuFpK/n
	/6imKNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHL2-00000006kom-2h9z;
	Tue, 03 Feb 2026 14:25:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHKy-00000006ko5-3a5M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E76B41818;
	Tue,  3 Feb 2026 14:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE64C16AAE;
	Tue,  3 Feb 2026 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770128702;
	bh=6EMvZkgDU6raCiY0gogzPX8ZGTFcc/rYdyidvuM/lyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TofMpem5AaQZDe2WDMwQ54H8KjbhW0m4WdSEu9JYFmTwJtNdq8uAzWC/VpQNI5u9o
	 5zBzeRquPor6Q/uh6QaDhGhb63OKgdTNorw8JPy3pnedoCsYb0GQ3llAK7qtFS8+YO
	 YmLzl7uTo1+0dlxxXs9awI4ZyG3Ads9/HDFc1U5GG+2XvV0GCcsruL9p4jUFTSs+2r
	 qmcrn8N91BbzUR9ljtIxf4gbC632irKAPm0JVBT7lHgz4g4gZuibt46wQ09bcWfzF9
	 bjL7hY1tYJ1Q8sNRP9mNj4jMfNwUklkx07R2EdShKJOE/s+X/8VmkMlfCTtsZqNO9K
	 6xYtpzXsTDW3A==
Date: Tue, 3 Feb 2026 14:24:57 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Add new sensor unit types
Message-ID: <20260203-gregarious-intelligent-crayfish-6bceec@sudeepholla>
References: <20251021165212.749372-1-a.shimko.dev@gmail.com>
 <20251022-rugged-archetypal-wallaby-ecbecf@sudeepholla>
 <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPX744bwwZHEODktumJbE1MUyfDgYj3vrexT7GRBZ6BTrECXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_062505_267288_B1CA71E4 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, Feb 03, 2026 at 03:45:28PM +0300, Artem Shimko wrote:
> On Wed, Oct 22, 2025 at 12:22 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > It is still alpha, we don't add anything into the kernel unless it is
> > of beta quality.
> 
> Hi Sudeep,
> 
> Just a polite ping.
> 
> Is it still too early for 4.0 bet0?
> 

v4.0 beta is out but I would take this with telemetry support that may
start using this. Let me know if there are any users before that.

-- 
Regards,
Sudeep

