Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394DAC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMjuFcF1JOSdoZXexZR3W9kBR6KPAe7iuNXDZe8pc5M=; b=e6WUls+VQBn20FvPghPGVdqGum
	cgguL4+3ZuI4pFGiSyG47Rqmj6+Ifhl6LE32QQHkA0QnfQdCmjX+uJQHD7Ip2oRYfxuze1EaYOocT
	Ox3jENbGLwBs+ZGmmR/diSwuhbxpvghxZHfhU7h2vfi+ONILf8xdLj4Hr+PdMZW4x8ehsvP3Ugixn
	i5pTqJDyAZVdnW2FYv885z8Yy0fI/EFepHwhAVQbANtIULqVSeihUcaC3v7WsTT07EazeBUW4lt6r
	rXZClhh/qYTgYSf5VjBCOuKbY+dg2KztiwlkwrZfUKVLSO5A/7TDY+eNer37scKEYLeh6slCeuInk
	GzsC0lDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVTL-0000000Gb5j-1Gz6;
	Tue, 30 Jun 2026 10:13:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVTJ-0000000Gb5D-3Y8O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:13:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4926e5803e5so42115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782814420; x=1783419220; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMjuFcF1JOSdoZXexZR3W9kBR6KPAe7iuNXDZe8pc5M=;
        b=AO2WN0Ar+PZxj8gCyepmr8Dk4AGmRnn+PDjWLY8SOYucKue0b2LA11hRFtOvwm333J
         qkemKTz0dkJEBNL5buHAPeYhYu43HgITgsJwhRjwEMHhYme4TW5osN4ML9ffoCkA34Dc
         Ruv8vaNPsVg5G92rIRtOJxRgZXLEkrjzVd1ofaL0k/NEH4prZTdm1YvtBWhmENEG7jFp
         EPygb0NTzjCMOvNcnVHnGB1nuMmhXcfdclXY8RMbqBoAtG+b94F+OQmYtWZk3JtLJqia
         N37mrYg+CwOIpzn5qRqzA+1W4s2O55QStuR1QL9kumoS2sjcEmnqKjKNJFwUEIF2RmqE
         vnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814420; x=1783419220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nMjuFcF1JOSdoZXexZR3W9kBR6KPAe7iuNXDZe8pc5M=;
        b=jOmiNHqKodcgsEC1sO9fxdwc+6iClrqQAn1eB8HIVTPBc+CTGp6t+ty6Crm+oAXA9G
         X0wyNSdpbpVFl0XjFkFH4IOdBGU9gqit3kqjZHhfDSFAdnlpt8WuFsC0rorjnKAulvAi
         E5MWRA8rIIv3NgmgoC34oP+YWt6ajIBeE7Kb4VLqxdNMIZ6kYfZ5fKrqnmwW5FXXhoQN
         6xgipXv36MaEiPajKSs/E0XK3BmRD0mDAygU/U0cpvQmAoDjDyZTSu5aRdI97gwTl+eg
         c1jjpFltY08enXXLHwQQHc3swOAak1OgCd5Tlq5xxjy08sD8Fm2VvEia8UVAmPlWeo/M
         uypA==
X-Forwarded-Encrypted: i=1; AFNElJ8XeSBraTXerQ7FTD60aPwV9DCNUdZT11Z3njdc8KAtZwGx2dk8ujMflroCvnQauYm1+bPBmwu/ZSGUJ0jOwtnS@lists.infradead.org
X-Gm-Message-State: AOJu0YyW7k2itjgC1BnHYE2870jSDseeDiPlJTozM2Ih1eW13Xg/j9sF
	IelaCyumBnfHISGD9mk8bQuCp3hIOL114IckLsb39KPxwZNt6sB1gAvXAVZ5WVcAuA==
X-Gm-Gg: AfdE7clTvaptxD5pCWf/upgdJ1ot7s7JVqQAI1R8rgeiQ2tmroknicK406wohx9egzG
	ZzqCKgpLcH3rViX34HmKr+3OHMGCaKxhX6rINVeRJvfTSXVtCT0pTcZp70VoJ7UHRg9JycYcAaW
	RaHg9nqx+aKj6DTAveTkQlRRdRrCFj1wv8KGFj1dZ15SvPznFmbHqr66S+xleFeiPNgQh/i2Qzq
	gsFRStA9nBCKQe9vmNg7nQvaakPwxCRX1X7crInFep6c90sAYYJFWMag5e1aZUbZAmXJk+vHphl
	eq1RCZI/DZ6bH6zR9K+ibNMo5kXpwW9p0czGlx92qJEWIc0J3X1gyILnYiKhFfm3vpnUyZGxG4b
	zDvkFF/fODHIBSevYQ90qU4jWnCEVpkdTZ3eD6bkiFjVWfE08DhEVr63IcG5wy8oSdDr5k0AFtH
	2ksUbdjowmyOdtKLG64ni+p13yymRBmzwu7RKzS68OP6F+m7PS+Qz4sKIyftNYr6thr2RQ1Q==
X-Received: by 2002:a05:600c:3e0d:b0:490:ab15:b9e8 with SMTP id 5b1f17b1804b1-493bd6f0744mr57395e9.2.1782814417931;
        Tue, 30 Jun 2026 03:13:37 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475671d02f5sm6914506f8f.28.2026.06.30.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:13:37 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:13:33 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: catalin.marinas@arm.com, oupton@kernel.org, sudeep.holla@kernel.org,
	will@kernel.org, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, maz@kernel.org, mrigendra.chaubey@gmail.com,
	op-tee@lists.trustedfirmware.org, perlarsen@google.com,
	seiden@linux.ibm.com, smostafa@google.com, sumit.garg@kernel.org,
	suzuki.poulose@arm.com, vdonnefort@google.com, yuzenghui@huawei.com,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/7] optee: ffa: Add NULL check in
 optee_ffa_lend_protmem
Message-ID: <akOWzVB_yw1-u5uN@google.com>
References: <20260617145130.3729015-1-sebastianene@google.com>
 <20260617145130.3729015-2-sebastianene@google.com>
 <CAHUa44GST=efeDepEHWs_=ehr7JVnkg+y0ZLebcLAGZXxpNegA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44GST=efeDepEHWs_=ehr7JVnkg+y0ZLebcLAGZXxpNegA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_031341_902544_E9F0CF1E 
X-CRM114-Status: GOOD (  15.39  )
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

On Mon, Jun 29, 2026 at 10:53:33AM +0200, Jens Wiklander wrote:
> Hi,
> 
> On Wed, Jun 17, 2026 at 4:51 PM Sebastian Ene <sebastianene@google.com> wrote:
> >
> > From: Mostafa Saleh <smostafa@google.com>
> >
> > From: Mostafa Saleh <smostafa@google.com>
> >
> > Sashiko (locally) reports a possible null dereference under memory
> > pressure due to the lack of validation of the allocated pointer.
> >
> > Fix that by adding the missing check.
> >
> > Fixes: 2b78d79cdf96 ("optee: FF-A: dynamic protected memory allocation")
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/tee/optee/ffa_abi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> I'm picking up this isolated patch from the patchset.

Thanks for letting me know, I will spin a v8 but not include this patch
anymore since you picked it.

> 
> Cheers,
> Jens

Sebastian

