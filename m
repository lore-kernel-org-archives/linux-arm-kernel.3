Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1E606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P3GW6fHx;
	dkim=pass (2048-bit key, unprotected) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MSrXLDdL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=; b=P3GW6fHxdt7dxILaj6ruuPvQYz
	gfk/1EwsoAiXq3pNDG8DtgflS1wI9r8TREuC0Pd7NTJ6uEcza/vc6gIO+ZNgcUYwr4VH28Od+810M
	dhTGT1VrLl+fAsXL+v9yuAd14Z/I96EyGN1sBXKEaTl0oQb6myBH3MfcLeaeASs7K2Nu0SEcUYOWY
	KpNBHa1xelVgyCk+3wHTwtqwRoKitwbkCxk8/qc/ycSRO18WPmQ0uraGaKcjTZSpLJr3b3DXxmg4x
	48tnAOLxXESUlCTx6ND7Zz2JfrVsouzhKzOxZ9TD9M7Yy1mHmBvJMY3auqElWIQg92IxtryYr9HFJ
	EAmhzb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEUS-00000002XUy-3VJl;
	Tue, 03 Nov 2026 13:23:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEUM-00000002XTR-3jpW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:23:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so42443285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1793712224; x=1794317024; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
        b=MSrXLDdL4ZkxiOzoguD6GKyS69seAqvKy0xTrDYPswY4WkAQbb6PDJNsi4sOKpb247
         xgRbtOe64BekFcWqeUAOZ8064WpmhF6ftwg+3u+1AB6+XQ8mqEWp10So6ip6hDCDXJNd
         Qfg8O2l2FplKRbhL0LoVmoeGD8NGgyQIITu6BdQ6i2hg8I8x69GFhWZCtosVrJnRn5HW
         SvUIU4qXRAKPC7sIJdRUXBldCIfEU0FYsg5ILD/PjZHnGA0OULrzz2ZwYlds7nGTCrMI
         jSIv4UoDTSanbbuWQBRouOdGl43bxthhKKYgmcgkohzlNm3JXHnmI/toFb7XBH5MMVIG
         zzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712224; x=1794317024;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYqgeXyiX8XVMyFZcD47JEncntf0/UCmpJA/xWCOZns=;
        b=eyHekOD/Ia3zgJv164AaAQjvTqgfcEU1tx6g63FAintZfGpYWythW4t8rjBsETjhvn
         RF/8s2jEacU2+v8sfOf+O5l1gIEzYglTJK9SC28yGMkyZ3pwahDqYbhB1z0+pDP61fBh
         U8jqs/U53YcmtKMRcivubWEyq5Nv8zoo+iSZGh44KgIDcWUgrqOo86DFP6Yw2M6aE13a
         ZJBAMVVdjIOTvKXQuluR4M7Dob6Qjl4TEsD4+b9IJpXQw8sCl+fHJV+JxyqKmFMSqcie
         Y5qWzZzIWgGiN+oWEMGn2SoOUOnwCztoxcFrOa29RG5JmvDB/6B+uFj9dhHb26mV394p
         NIEg==
X-Gm-Message-State: APuU4Z+aSo5XFdgYaHovIcuZBPg4me/rd4H6zfAmCNo07Q+PPoIYVXC8
	fyiVq0bOeKZCXFd5AGqPEBYPi0pgiKk1oPi4sGjkFs60yNV5xFeDE4Y4EqhEzWBiJ50=
X-Gm-Gg: AYBFou2J9+P6D7W5Ay/RZLt7v6biTBG0D7pVYoqJ0R4a5/JrwnSJESNbAH9F+m+WgtF
	1e9/mXXb5YoYGKLGc91egd5muMSBabkzr8R7fb2MwVVy/iCBShoYNR4We2m21iwZdjrLNH4+uDj
	iH4hnqJmP1oIa35gSVOJBnrhk1dvwFdymq+ebiDZCoFobQx/W0cWbq3iwz7Y456vm+oiZT4uiKL
	YQJgAaaWZ+k8DfGpPXaz55YCi42Zq0LjbPLU118udpw0ASa76T0ROAwbNjuW1ogNmELfTVcxeZe
	FsYqd0ThLB/KempKyirXwJKeYz1GtJMSx5qSqvbE26vRNx84vW8+euatSWa+EKLmlsPHDIgnyOc
	elX3Oq/tBpt68iu2ZFp9a20e1xJEEzuM2xLHHaurxzzTh9SokoRVe8WEO52XjeyW3a4DAFy/46G
	AsbGDDsJ43un0DtM0JaeLo4PxJbfTLqWLixLQminU1B+ESgfAAwBWiXX+hueEbASly9RNLbmKQb
	dk3j7wCaIwuN3X0sIoR7AUmagL0aVljYokPgqnnoNTkn+4PLdvdaFGIh6iQfyPSRMO0231Nn6FY
	Ii6FziSAVlWYzjKseq/Khhud1tpzTOWayFhM6iZB4CDT6D+V2FIxjIEEVw==
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr139983985e9.29.1793712224232;
        Tue, 03 Nov 2026 05:23:44 -0800 (PST)
Received: from andrew.office ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm163615055e9.2.2026.11.03.05.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:23:43 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,  qinjian@cqplus1.com,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk,
 soc@lists.linux.dev, arnd@arndb.de
Subject: Re: [PATCH v5 0/6] arm: sunplus: add Tibbo LTPP3G2 board support
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Thu, 24 Sep 2026 18:49:16 +0200")
References: <20260924164922.117236-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Tue, 03 Nov 2026 15:23:39 +0200
Message-ID: <sa6mrrqhwv8.fsf@andrew.office>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052347_273125_70E41692 
X-CRM114-Status: GOOD (  12.44  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Andrew Gaylard <ag@ffroot.co.za> writes:

> The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
> https://tibbo.com/store/tps/ltpp3g2.html
> It is the platform that underpins Tibbo's industrial IoT products.
>
> This series adds board support to linux-next:

Hi all,

Ping?

v5 was posted on 24 September.  Patches 1 and 2 are DT binding changes
and have been ack'd (thanks Conor).  I haven't heard anything from the
SP7021 maintainer; mails to qinjian@cqplus1.com bounce.

The SP7021 platform entry in MAINTAINERS has no git tree, so I am not
sure how this series should be routed. Could the SoC maintainers advise
whether they can take it directly, or who should pick it up? 

It still applies cleanly to v7.4-rc1.

Thanks,
Andrew

