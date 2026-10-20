Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XR2Fe9kj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N1AKUibu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=; b=XR2Fe9kjPd7sZ7oQ4E1QPplGsG
	Nme/n49n/8YMzsyY5C171cGWhJH8cAlKcuUTxTPLJccBhWelZFh9B7cFaEBsBlJFos9jA61DP3Z0m
	byTKUagSyzfJrPXvFXjbpe6fbhlk8/yGuaC7PNS6Yc+0Bz1KSq2CRIM6uY0TDZ8tTu8pae7vFB27q
	/mwjJ8mMnajc1ua9f4YeIQo9v9GR7t+04yGpAMJnGDHxcq2o44JY/1G3PM1MPWFVbulC/t5vU84F0
	O7Tz9mljcCcTFtzj1WJLFAVCieH1b+oTYqZ0PA7STPqUVReAPej/4cC/vYVNDwg3fF4/y/uRffIph
	IaJq4NFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzoQ-00000008hOi-3FeR;
	Tue, 20 Oct 2026 02:42:50 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzoO-00000008hNu-1LGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 02:42:49 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-4a75171af39so658338fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 19:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792464167; cv=none;
        d=google.com; s=arc-20260327;
        b=e1qz4ad6Itk9AiQnt0fR7ePQUCEqZ/K9fyP57X1N5uWMSL6H4z10O00jKediTuwyZb
         YkwVFBv1NXA1uIWUVFINrnWO9pX1V8FZA2BSIRwUcMDj3UmdDO1aR9H2FGm4LGta2xwN
         9ZxVTupnBXpaToxgfiAN2nAMBkCMYs/fRfSnHoErV+cT4CllHeST9AiXZhqtwTs9P27r
         RnrROPgWzmf9lJzYmZru4wXNHrW04/QIbR0OruhHQwMW5bnmysW7Oh1sLsLp2etJ6kr1
         Ae8qxqambAjuHNy85PJpCsatLyTPwFom5RQXs+uoOlA93WQ5WU7Upv00VbA9yGH0lZ9/
         0n0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        fh=jCdsx7CceyVPan9r/jsdBAhzI65oAUupJkU4P4U29o0=;
        b=sw/88XAI3IWSt3f/IF0Xi1FUpNXhTfyDfrCaQkx5yKDM7z6eAtaN1FZMhEMOiv8WnL
         O7tFpq9WYcaIalk0wVo7zzaO3pmwXqlhSHcX1blS+crTkjbSkjcLxXb/ELwP5clxynOX
         AG0zwjaIUo95T/BXemzYGXI8QPpljmVPNytfziJfFmJ3++/+7Wh7rKH6Wn/k2mXM8wvI
         WWX2BMZk6z7N5+Jlj+nQKATg+BkRg+kwhfvlp/12Mjo4I9EiOKGUXoQhrFp/Zbc4bcE1
         TenGzvff+liCguQS90jbx8fbMki8WBH/dvr94oMTP+mu4iiLvtG0/8ICPiYQYXUICLCJ
         FWLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464167; x=1793068967; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        b=N1AKUibuP4lD2SCGUROtKloUiwSuw1IyJYhb03JqDwQ2insQSv8lKOn7wiSQizdV/e
         vbYJiyhm+kmbJm/fOLS17zome1jTQw05BSstYjAQrEjOzjMneXzi4nSt/fg3lurIk+l4
         30LqO07YtGwUd8yEZr5mXASmI0Apj7Zt3NAqBnVzz2Cqvftk8eM/e+RuCd09Xt4Y87Lt
         psEeLWUlIw11z4fTdKApx96vkFAyg5jOjWRuxtbQ8Y1UqMh0dmU1xu1ueZmY6HejhJyl
         8Larvh2UeTlVNAlVtcSH9OteORZJ//PBlSG1X5DH8ns/Ax0OqlNDjtklmr7Wk4oVo0bp
         DN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464167; x=1793068967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        b=VO7hVgKTAyUDX53pauWDHeVwMbIpw8eVyLII92c8WsjJAZ9fZRD3BnaXqZRL0Gpds9
         NWJOV6/XTTaBvrWZsgtDRfQrWAZNFdYEYWWp+S6I7enGY7h0Wo0JK/k0c+fKbHwz5oHv
         i4BjirdC3enn51Fbeftp4VoWnXUv1lihKg74vttFrTt3uJrqS3+pJcN097HgjW8k9VQI
         02xMCodOlbrkGmH4c22JeBHpeGgndS8AZQj3xfgGhQQm3TbtSySk3lQnS0ALAJaMNEsq
         uwHKSzOSNwZSicWxgC5d/oJYlEBh4da8yGmcVlo6LdPOwxCA76cMyX5OqezItP+YFr4a
         e+Qw==
X-Forwarded-Encrypted: i=1; AKwUvBz8jsGuDhuRAi4jiwhgswo4lCyig8sUaP0I/SYXLJbmy61GDtNbDVNgWeSI/GFyOD/P+BRD/WYz7qmrX0bhlmab@lists.infradead.org
X-Gm-Message-State: AFq9FYIo/RhombL3454v4bDap35sq5jLXfPWJi0dWYn3Uvzwz1YwGNRI
	/LwldqxdHjnk27Byf4KsAPlq88AWK7xdoGg6wRqV8h225vEyJtRXLdXjY5FpUfW74LHPEACEh4I
	bh9EaocHJKRnMXHXzVDJuKdvaX2E3cPk=
X-Gm-Gg: AYBFou2/988sb1Cma3tk9NAnBd8CEYyylDy/iilqmItK5VEt4r89pkIFYMGyl9nXOe3
	CV8gKxC+4WPTfERv+fQKvS7L7WSXn0iKST/Cp9n6u8fH6e7TnJonn8fct0KOu0kFe4+mpgtzTYW
	bYkAeX+igYIwJL/TJZbGTOU0eOrzvmlfx6zpxUFJTS+zY1N+t7lX0t+To4zFQ8Lgfm71AoSwhp8
	b/1/X45xvgZ2q7jl6uCh8y2czq3pkEqzMOvPMIzxWLUAFZAE8E7r37yLA2gwM6Frk1ATyuwHJJJ
	TT+4QhriKTD6mE9A1AI102Uw6FG9Xk4Ik/NNrbOfDyGNrflp0NHNMSq3
X-Received: by 2002:a05:6871:e014:b0:475:a112:1270 with SMTP id
 586e51a60fabf-4a757a3d072mr7064152fac.29.1792464167002; Mon, 19 Oct 2026
 19:42:47 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com> <179214234859.408196.13768026652794039093@kernel.org>
In-Reply-To: <179214234859.408196.13768026652794039093@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 10:42:36 +0800
X-Gm-Features: AclHuK_uSJLvIyJgGxf5INrqsdVDsAIH1iMF8upEY8ZK_RGHk9iIGwKJao2ZKNo
Message-ID: <CAHGaMk_gjN5v0HBQ8U-8FoS--nWCS-8j1M6LUSSma=rY6pYFKg@mail.gmail.com>
Subject: Re: [PATCH net v5 0/5] net: ethernet: mtk_wed: misc fixes
To: netdev-bot+sinfo@kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194248_371965_2E506F67 
X-CRM114-Status: GOOD (  21.12  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 5:19=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Patch 1,2,3,5 were found by Sashiko

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Patch 1 compiled test only since I don't have a WEDv3 board.

The rest were tested on a mt7986 + mt7916 board.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I will send a new revision addressing issues found by review.

Best regards,
Zhi-Jun

pw-bot: cr

