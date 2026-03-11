Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7F5FD88D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=; b=29aoapzZzmHAw6PZu18XtgdTDU
	2hHjBavgfREDJkKFOAy62OFxqmSFNNeL/SbcV139Sdc45/m6qWWn8On1mIoc6qtw3/aDHVIqgd9NA
	FhRI493RAz4YWrosKCI7Wqxd4TzLIzYFPdEBruNOlW5RWXl/PCR+f6r82JnGygmIz6bwQgCCz3en7
	S/h6y26eF2L7MYoAcRLGrMZvYqjjHM2bWDz0ecVBSFZXmlOscIG8iXaxwT5WJIQMw88cBBMVW2uyO
	V88nJluPqvjfVPCOQ5aR5k5HxParLX4eyMIJ52tTWOdJ55d5A/dI5w5qMwLkUkGnQol1BkBNl9CHR
	mo8gC92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07FR-0000000AQ1p-34LX;
	Wed, 11 Mar 2026 00:16:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07FP-0000000AQ0u-2ANX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:16:24 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b9704cd6951so251501966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773188180; x=1773792980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=C6jaOCyLaiHbh2HpZGeWyF+YqlqtAjNur4mgtW3OovW+7sJgqC8js0gl9yvpJnp2/Q
         6O0kt52+30yquyrrep5OP2t3A7HBAIE7Bc+3gE9AOk4NVPyhC+OCrjPLPqMR1hiYHYvk
         JP/Ud9owqYKNHTP+0uWv3GItEFPG20oh+oXVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188180; x=1773792980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=wOQxfH3r/olwoQD2xlM0GzjvKkcrJncywxTIU4jdZWBLzl9gFSjuY47ULnOFUl2dAq
         0D2dqvj0lP37X6Q+R+qTvOiBXTNbwL8+dhg6H6G8/g/oHrx7arY2Sb32HbJll5oHEAHj
         7BZoxU+i0b3GWzEhf52cjy44w03tBrEFRrhaxdVAQYnUX+8O/9NhKYtKTbD73LFABEuO
         mlSN3mAmo1IpFmYc9KiY5RzdZY36L/aTKHsvIFa7+nUygHbgGNlyR28ptPy7w76+qdtf
         XersQ685b+u2hHhayHwTMrJsap+RuD/5h5hcZfAPIllN4tyqiDUWsnjsmphyA6BGjRrh
         EgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7/dL67964iQlrWPju1t1axx+tvvaSCzXmVi5m+kvzZDdvGP0Zdxl2jEYQg0TV/GGtCJOXu7ECzEcF7+QpyhSF@lists.infradead.org
X-Gm-Message-State: AOJu0YxFHqR/nDO5nxSfRiLlfqirCNDa6qw4qMFHwmpYBFUZT99H2TZM
	S8Ggx8pQjNiQga41uH+t+fexXWW5vdR3yPFju5siMcpOu6PEm7G7kELJ77MKcZffg7EQeHUfDL+
	rCe9FgXS9
X-Gm-Gg: ATEYQzxoY8xeL844HBtUmH58jOzn643Gin37i3uWQOT9G5JxA4pSPjDsDtx2KY1xGZy
	k6muwpICJuy9uuZRQfCfnUy0wfLeTweUPMxWhD+vPOJYwirwIXx7Kd/IKmbS/FE2TuK9kVxA71J
	X15AS91QlH1K67LIHEnWTiTpgTjMTjugyFvipDpJ4zDrxHdCQZRwQHk8TDy1337nKT6ur0Fv2l3
	fFR1MtUuvGdk7jKasEjrBSkb02bHHlHuuBhykK1/AItg3H18QpZ7PIyrce7Q6oYgjgsxf1A9My+
	vHlwdrYk8/Rz+V5E7W8sKh77Gp3S6N61JO95JwMcvD/tUumIczg6R/3/4y1ETRPTvp4DCtPrylV
	SFiQbRVKREFPK63OpadLIp7Nj4vFs5f6UNOjXXTMQuqQ8ZDxt08CyhZm02psV1qSM7q4K0hrVID
	PSEglx3xgF6Nzt8iEjH2Nmmb2pytirekXeUsYbvsmY23wXwlvG2ZyS14sCuJ5OLw==
X-Received: by 2002:a17:907:9403:b0:b94:ec:4b42 with SMTP id a640c23a62f3a-b972e4f9f49mr23762366b.26.1773188180439;
        Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e1be45dsm13949966b.64.2026.03.10.17.16.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so9077443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2QR2OkqEBIbnFA+eRXxKkxTHTj/Yw9bCIbwI1xOzAgN8tuN3kGpC7X7Sc2/xYUXoGk81NxXW23GZm/RnjXWts@lists.infradead.org
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id
 ffacd0b85a97d-439f81c8cc0mr1467675f8f.21.1773188179252; Tue, 10 Mar 2026
 17:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 17:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
X-Gm-Features: AaiRm50L1dSQfXqKqL2lF5VIOHGsndPMM8bpxj2iTcUPN8asbNOQBrAMfnlkmEo
Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_171623_574699_96CC2BF5 
X-CRM114-Status: GOOD (  22.86  )
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

Hi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function

In case any mailbox client API users want to comment, Jassi has
proposed an alternative to this series:

https://lore.kernel.org/r/20260310234616.334498-1-jassisinghbrar@gmail.com/

Feel free to join the conversation over there. :-)

-Doug

