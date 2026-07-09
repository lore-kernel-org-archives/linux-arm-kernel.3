Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82571C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxLey4kR4pPKpR8Eqs6jpbSuCMQEbnoM8JXbBb9w8kA=; b=wSATHbw02zviSRhEGXfpaOS4rK
	e+rj1MjdiwpYxoxuPK9QAhRCV5WZP25BQxz+orxStElZAghgXcOpYwQlJSxkQ0LgPhtNnnlGCBl1I
	rwss4XHgQ0YPHgBV1hXexqt+CQ0notg0cOk9UppERNGoeuFgoLQK85/o58A8YUJLkMc7TyZDfHCJA
	Klt8Zil3DQ4XsVQYjy4mT8qdWmKLAcdkI3ZWvp9l3uSz2TBy01RqWEgfXI4D+spkEgBVlMX9dkmA8
	5GZJAR9gEh/WG12Pwgld5Wueuhq/Xwkzi/3sD40MghZ9JyU6zm5unkpgi5yeRGuo+FmZCpFpbBnQM
	gGith1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlyg-00000001wP3-1VD4;
	Thu, 09 Jul 2026 10:27:34 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlyd-00000001wO9-2GeQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:27:33 +0000
X-Forwarded-Encrypted: i=1; AHgh+RovnK78Ez9jRzpyVgaNquPwqbo6s/NGWOikfh64gQD35vr4twKUP02qnwedOAcRisl420Qwvwoq8sbycPZtHbAg@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783592847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MxLey4kR4pPKpR8Eqs6jpbSuCMQEbnoM8JXbBb9w8kA=;
	b=C/e3t5FUwuTLwP4uK8UTU6koJ7BRtXeXGz3SElLrrbQuvgwVY9d+E5d9Mor+dh1UiBRG6b
	nER/HofP/NZoDBU0qn+jYRMXjmTxSPd+hmVxYgYbpfcFKIaem6tPfEw/aIeXek0uvAnBe+
	rh8nU2HRz0RuYY0TFWztLMsACrOrBAo=
X-Gm-Message-State: AOJu0YwvrQKJXJxIW4sbqRHSqBKqlTpjLkRfiIsu+y8jZZIbmaxkjFa/
	w9sKzFCEWBpByrEeyhv4JmsRERPBcvQGcRvbWDPz5ZOLMTXHF+V9oGrVqtAADkPuQ5Ov2iQYaYW
	L0g5KaPs+97CgST7ksXqaygBxnWpOmvfwfNUjrKeS
X-Received: by 2002:a05:622a:248b:b0:517:5ac7:332e with SMTP id
 d75a77b69052e-51c9a7990e9mr6344801cf.6.1783592838569; Thu, 09 Jul 2026
 03:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 9 Jul 2026 11:26:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
X-Gm-Features: AUfX_mwpyfAsKpUMf2tNxcvppePr82pc_iCQFLAefIFcUoHnYHNmsUIYIv4f_m4
Message-ID: <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_032731_790396_6A12F29B 
X-CRM114-Status: UNSURE (   9.75  )
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

Hi Mark,

[snip]

> base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37

I think this SHA is local to your tree. I can't locate it, and neither
could Sashiko [1, 2]. For a series this big and complex, it would be
good to get Sashiko to review it. Could you please fix that?

Thanks,
/fuad

[1] https://sashiko.dev/#/patchset/20260709-kvm-arm64-sme-v11-0-32799f66db9d%40kernel.org
[2] https://sashiko.dev/#/log/baseline/42725/0

> change-id: 20230301-kvm-arm64-sme-06a1246d3636
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>

