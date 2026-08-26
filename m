Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D4C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 22:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw3MQh/OFK6YC5nj2b5LHhVJ/FGQEIzYpkSWqgAVzmQ=; b=KRyzOziGSIK97X95EuluxpI3l/
	K6rnBZfZwzihcx3slmR290Gy8x5WZbraz+5yJ/El9bb2jqv+G21xvN2LuR3yz79lp7FW0FtxAKYx0
	Qkf783+GnxJzD1IrYhJyYxCmOlRvpndTHq6Qm3QIZvUfmgIyliXp/PKNWVJ2vQ4DeQpedGWMDRDrg
	De0ocC7QvQClDL/7M/8drHqq6dWBXEhQ2eFYaLT/ZB/BuKOqRuaZ2ALBUSlO7KIT1EIiAjo5ocLaB
	fGU6uEomUD5MsDDLCWhbHDPUDoDbLd0AoyLACZtTj5KWjuhrwPXJutr68nqlAKtI0LTi1GzWWDjj4
	ZnDT1HIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzLo6-000000033tP-2Dqr;
	Wed, 26 Aug 2026 22:09:18 +0000
Received: from out-140.mta0.migadu.com ([2001:41d0:1004:224b::8c] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzLo3-000000033sZ-0tDk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 22:09:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Yw3MQh/OFK6YC5nj2b5LHhVJ/FGQEIzYpkSWqgAVzmQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787782149; v=1; x=1788386949;
 b=IwFzrjNNuNXx9xXvLtKJkrKI2bSTzcPX4wQuq0vvnyznN0sPduxfNbFvI6Uh4h2N5Sda4Aqt
 ozFEBO70lPbil44hY6lvmue0DLcxEYWkkRbLSOxkhl/kRUqvU4wJWz/2+pFtTSWfQtVZFtKudWV
 ncqzkyTD8g8GqYUSDxOvqX9w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f49.google.com (209.85.167.49)
	by smtp.migadu.com with ESMTPS id 46a57f44753a733d;
	Wed, 26 Aug 2026 22:09:09 +0000
X-Mizu-Trace-ID: 46a57f44753a733d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0129cf6ffso2552e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 15:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqFvP/6kj6JeHKAJf5v5/8FI79kdWeAg250cX0cYUGRarKGvEXHABF81viNrXElyHkNHnPAJSZjzwLkMhf3NiOl@lists.infradead.org
X-Gm-Message-State: AFuF++njqjEJhx0744EGCjW9JVpX1Se3HAwC+DIehPRvANmL9j21E4mW
	ptnwMSyWR7YlPKXetkPmYq2NGaOakr2WXhGrn/vXBAo08Lm92lrsYGnxsUr5XH3cr0XJvD1jcQU
	0FvnO9ptlUfPY0L2cvEQT4AOKoo3DuTWNRBhXd+f1
X-Received: by 2002:a05:6512:3502:b0:5b4:9dba:4ecd with SMTP id
 2adb3069b0e04-5b503831de7mr21458e87.11.1787782148264; Wed, 26 Aug 2026
 15:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
In-Reply-To: <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 26 Aug 2026 23:08:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
X-Gm-Features: AcwNN1VHViyn2yKtdSqUAjBUdbIAmztuL_h9bkSS25W3YELWBQ-0YqvkOY06ffM
Message-ID: <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under arm64.nompam
To: Ben Horgan <ben.horgan@arm.com>
Cc: Xi Ruoyao <xry111@xry111.site>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_150915_691905_4A583B63 
X-CRM114-Status: GOOD (  20.07  )
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

Hi Ben,

On Wed, 26 Aug 2026 at 15:48, Ben Horgan <ben.horgan@arm.com> wrote:
...
> > I was wondering whether that was deliberate. AFAICT, restoring the
> > writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
> > it may not be safe on the machines the override was added for. I have
> > a patch restoring them, but I learned my lesson.
>
> Yes, on a system where the firmware ignores MPAM, MPAM3_EL3.TRAPLOWER will be 1 and the traps won't
> handled and so if MPAM2_EL2 or MPAMHCR_EL2 are touched to disable the traps then the f/w will panic.
> As you say, if arm64.nompam is set on a platform where f/w has cleared MPAM3_EL3.TRAPLOWER to 0 then
> the MPAM registers may or not trap . This is different from other features because the EL2 register
> than configures the traps is MPAM specific and not in a generic register e.g. CPTR_EL2.

Marc's "Fully disable configured-out features" series [1] runs into
this too. MPAM may be the family member EL2 cannot put into a defined
state on its own.

> There seems to be no way round this other than documenting that you should only set arm64.nompam if
> you are sure that MPAM3_El3.TRAPLOWER is 1 as you otherwise have a side channel. What do you think?

Documentation it is, I'm afraid... :)

Is there any way to find out what MPAM3_EL3.TRAPLOWER is set to? If
not, could the caveat go the other way round: arm64.nompam is for
systems where firmware ignores MPAM, and should only be set on a
machine that does not boot without it?

__activate_traps_mpam() is gated on the same ID fields the override
clears, so KVM stops trapping guest accesses to MPAM0_EL1, MPAM1_EL1
and MPAMIDR_EL1, while still hiding the ID field.

I will send a patch for Documentation/arch/arm64/mpam.rst, unless you
or James think it belongs elsewhere.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260302115653.1517326-1-maz@kernel.org/


>
> Thanks,
>
> Ben
>
>
> >
> > Cheers,
> > /fuad
> >
> > [1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/
>

