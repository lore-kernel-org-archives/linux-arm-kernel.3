Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB25606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bU7EHs72;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cqBTknrW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sli5Tik7wgGinR9EmKOShOO8llB8BZYKVbdNtNJa+KU=; b=bU7EHs72uqOhVcMT0hMNwKjIHN
	2rzJtCWhF/KUHVMuNwq5szB+Ds3ogdcqL6h6pOoZfQPCg6eeOffdGFbC3Bi2tiYsOunt9x2wHIWxW
	yqFeQ8SojFoH7yCnZFouCX3nLRip/TJ3pyhmI53wzMwX4GL0NqFvkzs7kWwrCEsS7SHAYGrcEnLVR
	p4hlppaan+wFpnezvnaVYkS/JXAkZtMdyUBjyy8kZNnZcu3da6nEoFwYfMKLf9YM7KDFKX24KnBNB
	+3K+ihKunZu4bBtR+/JfRfnwH4Vh9wi6yKcT183y9ubOkgnX2pTyFT5dMXJq1XXLj0BSJHGerfmZr
	B2Ep1SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8Pv-0000000Axcr-2wbU;
	Fri, 06 Nov 2026 01:06:55 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8Ps-0000000Axbz-1Ofz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:06:54 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so218521c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 17:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793927211; x=1794532011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sli5Tik7wgGinR9EmKOShOO8llB8BZYKVbdNtNJa+KU=;
        b=cqBTknrWlf03aqejf8osnf+kWkhjlTlzy7vJI53x/L4ee+6Y20Qbadqu1n03cpTulo
         xfaaZEUTICSO5UaPlCHjU4fMsq1pW6KWeLZEXPZFCGJk48JQSPDFrd7794TbgA/pnSfZ
         dzUoy1ZislEoFZP7xedo84vsWvXp6RkGrXrxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927211; x=1794532011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sli5Tik7wgGinR9EmKOShOO8llB8BZYKVbdNtNJa+KU=;
        b=opAw+ttF1aTbp+SzPvDmQttBpjTy4n3RDzxJX5dGu7LYeMUAaNwK7QmSNL+PukbeXv
         UFBCDkMjfDm5BDF+cYMSLJnLEpzyz+3lgFDBBmTJjAvNoQouiG2GJpqiKmTsnLJHHywu
         2daOBTrMUc+IXD/oRB5H+8fampIq48gngzcCR650ucVyAkADnS6+QiBqoVldf29buLHM
         KrOv6ctkCrwTmT1MHtHaGny3sLl+M6eABnpaLTsr/Kb02wy2WoDB8b7IjErDw7KA5RM/
         3GbwyIN9P6yuYwpuXpCgqc06vJcTeDjABZsH7rqS0+wkpYRcX3zFSi3Eq1dtbDc4cBsx
         XAQw==
X-Forwarded-Encrypted: i=1; AKwUvBzevf18r3G9V84GAtiXjeKNSzlh6OtOAhk2alIK0Gg5pjxbBiHb8qpeh9w85HICfhduTkwJQp+DxgT3SQUfBjvM@lists.infradead.org
X-Gm-Message-State: APuU4Z8bFZXXV7dILeM3mqIXaDAlSnrz9UAW/b8QSLONfWGvc01jI2D2
	HnoS1gK1q9DS6XOkumk4MxFhGzJYXcDfq6rN3wVmAm3U0PDWYrL3aIrQXzorfUJrp5nAHFSaXoE
	lFkw=
X-Gm-Gg: AYBFou0qKwou1H6rEhWFDbSbfOxVYUnZX2pR1DVfOfaSgEuBtW6efvyifcJL09gerS4
	HxCV1LGwcwr5YtyjcRftkdBA0aRz+VKHEV7SFM9DbwvRgx/bbTOX+cwZ7iX/NvpN2A1Rjj4wAtS
	PF+E4griWtsOvKLyWfXyVsJYF8zGleGczBqoX+pk3VQl+2YieEm57KFwiAx9eUoj6khe2Lq/hAq
	VFEs4qA1ZTuqEJ+UwPlpui+5HJ26GLSQ+EkHVVjsf30hRhPcwpZ56pdI7VtU4Jj5SiRlN7JvyE2
	M0HXBA+qSO+7HAwRQryQwimRzgwF09b2M/FwgLb8ekK5piFqX+d5hNcqA6HPTHrawAs438jqWjB
	+Kj4279DSpqtQDLz+u991ZmjYsk/EHoMdza9+NiH/kYRmunYtR+s05BpTppZCEtN+1j4YUAFWJd
	2e4xB+b7ulWLzskgv5IHrxMxAmMG0iU3tk+y5NKZRgqCWsid6EUyV3fjoHqxDDleMcpzal45Fc7
	V46GCk/CwYh36gxhPisIlm8I22Dn8yOvECmYEnOPGeJfyiurxd7l991r0yzehADNmJOXqC3+P9s
	8DV1oB2tH76z90Dhg4NLeY8VmYmcO47LC8bbx2Ptybvns5AO+Z4Lqr3sIyzrLRfYPfs=
X-Received: by 2002:a05:701b:4246:20b0:1b2:558a:d769 with SMTP id a92af1059eb24-1b25d28c272mr1042791c88.4.1793927211233;
        Thu, 05 Nov 2026 17:06:51 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:bb6d:e00d:d359:7933])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b25e407bb5sm828381c88.1.2026.11.05.17.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:06:50 -0800 (PST)
Date: Thu, 5 Nov 2026 17:06:48 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 3/5] PM: runtime: Propagate last_busy from dependent
 to dependency
Message-ID: <au0oKFb9CmNzc6Cg@google.com>
References: <20261103221717.3840215-1-briannorris@chromium.org>
 <20261103141442.v2.3.I40c0bc917fa0b13111251844e9a54feb1d9cd7d2@changeid>
 <CAJZ5v0jWCz0XDgzeETbmMfGOmvh2G9qcx7xLODrpQ9NiwsddKA@mail.gmail.com>
 <auuICAm4BC_8Pzs5@google.com>
 <CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com>
 <auzlLwlleGLPsLcw@google.com>
 <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0g25xQeRaLJWJyAo2fcJko+gZ7w6JhX7FzMgRx2+uuimw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_170652_416732_6357E94E 
X-CRM114-Status: GOOD (  37.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:18:52PM +0100, Rafael J. Wysocki (Intel) wrote:
> Of course, it will not prevent the parent from suspending if the child
> does not attempt to resume it for a time longer than its autosuspend
> delay.  That's by design and you didn't have to take the time to
> demonstrate it.

To be clear, I wasn't just trying to demonstrate for fun or because it
wasn't clear. I think there's value in putting concrete reproducible
test cases out there. (KUnit is an easier common ground than some
particular piece of obscure hardware.)

> The question is how often those kinds of patterns occur in practice.
> Or IOW, whether or not they occur often enough to justify adding
> complexity related specifically to addressing them.

Well, I tried to keep very close to the spirit of the actual real
reports in question. So when commit c537d3457542 says, "As an example
[...] cat in_voltageY_raw at a 0.2s rate", I think it's not a far
stretch to test 0.1s too. And it's actually quite odd (IMO) if 0.2s
behaves *better* than 0.1s or 0.09s, just because it hits the parent's
rpm_resume() more often.

> > On Thu, Nov 05, 2026 at 12:59:24PM +0100, Rafael J. Wysocki (Intel) wrote:
> > I would love to hear your counterarguments.
> 
> OK, I'll say more about that tomorrow (it's past 10 PM here, time to
> go away from the keyboard).

Great! And don't rush on my account. I'm interested in eventual
progress, even if not rapid. I'm sure you're busy.

Or, maybe I should have gone to LPC...

> > I don't believe your solution solves the problem,
> 
> That depends on what problem in particular you mean.
> 
> It addresses an inconsistency in rpm_resume() and as I said above,
> this needs to be done anyway because it is not only related to the
> cases when children or consumers are involved.  There are other cases
> in which rpm_resume() gets called for an active device and the lack of
> last_busy update causes the device to suspend earlier than expected.

Yes, on second thought, I agree that your patch addresses a real
problem, even if it's not (IMO) quite a full solution for commit
c537d3457542's.

> > and my solution does while also handling
> > the inconsistency you mention.
> 
> I'm not sure about that.

Sorry, I see that part was inaccurate.

> For example, say a device has an autosuspend delay of 2 s.  Say it is
> initially suspended and user space writes "on" to its "power/control",
> so the device resumes.  Now, 1 s later, user space writes "auto" to
> the device's "power/control" and the autosuspend delay is respected,
> so the device doesn't suspend.  Next, 1.5 s after the first resume,
> user space writes "on" to the device's "power/control" and the device
> does not resume because it is active (its last_busy is not updated).
> Finally, user space writes "auto" to the device's "power/control", say
> 1 s later, and the device suspends even though it can be expected to
> stay active for at least 1 s more.
> 
> How is that going to be addressed by propagating last_busy from
> children/consumers to parents/suppliers?

Agreed, your patch addresses some scenarios mine doesn't.

I also agree the power/control behavior is a bit awkward, although it's
not very convincing to me as a use case. (Arbitrary/periodic fiddling
with power/control seems more like a nuisance API than a real expected
use case.) Or if it were, I would suggest solving that by adding
pm_runtime_mark_last_busy() to pm_runtime_allow() :)

To me, a more convincing one is: a non-autosuspending child with an
autosuspending parent, in a situation otherwise similar to commit
c537d3457542. The child is not likely to intentionally update last_busy,
but only implicitly via rpm_resume(). When you solve the inconsistency
with your patch, then it enables my patch to be more effective w.r.t.
the parent.

> Note that I'm not dismissing your proposal, I'm just having doubts
> about the need to do this kind of thing in the core code.

OK. I agree it adds a bit of complexity, but at the moment, it seems to
me like the most thorough way to improve the ergonomics for clients
(drivers) here. And that's pretty much my entire motivation here: to
improve the ergonomics of runtime PM -- even if in this case, it
requires a little (core) complexity.

So, I'd love to hear what can make the ergonomics better here, with less
core complexity.

Thanks,
Brian

