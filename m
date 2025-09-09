Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BECCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Zw59uJYB8zcIh7FLbcIyTw0ioHftmj/xE73G6yh2vKQ=; b=OUIAI+YJua1yFw/JCtGota7wLD
	X3sIDtJDjADbxrcjRL0gf6z1zXz/X0HHG7jFndNc5IxpkLbh7q103OHGSuXnjMo4hgwofhpwd9eGU
	4VC+wvsOK1nbpGnBFXTNZM0krDH6lOGjtP6aUhJbUaCJ8Rb3Gl0Ny0olBpafGRVWoUQKVz9oma0fb
	/NEPtpkc5FwO1vzEKpubUZWyBChracsmmsk5OFkW7B5COhM7cqfPDurp7FFo8NeVtzKexCfI7Ngzz
	JdNeH2mvjNRce2kx55mUozxVO6h7o+Z6TnXbBYYuskJ3jLLXe4II1GcNHZ9KoWnbnma7Z0oImck5P
	fLWxvRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6bG-0000000Ab6z-36AL;
	Tue, 09 Sep 2025 22:14:06 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6bD-0000000Ab5p-3cjU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:14:05 +0000
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-4111411b387so16080705ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 15:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757456042; x=1758060842;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw59uJYB8zcIh7FLbcIyTw0ioHftmj/xE73G6yh2vKQ=;
        b=glbQeqafI5sJT1/JxoEsTHVjvHvvh7MFEHpV5mHtkr7yy9RQyet8BxcBqSCle6Hr1q
         77yxfUdnzXkgPM5b+ZsCEeKmr6CBNnZzyFrWtLMYjQCJAm9Sn137/BO0f0iuY2Ehm8Jg
         6WKRoqpdzxF1wwX2DJBgivFEf2eZc/w46ZuFa55uFRv2CI2xXsIbl/MI6GarKUlcYfHr
         CGWjfXQ5hy8a02Y7FWVm+K+0KpTL6Xisq+5mmh35O+hppgvqc5p/BkZZxhQt0nPtgmVK
         eusVQ02i6QAIL+kitJBHHQW+EmAx9geq46GHo6nve0G4UJvEPPwL388vuKw1AvEmDnvV
         rxvg==
X-Forwarded-Encrypted: i=1; AJvYcCVDqHWBLmLFwyj0OHmWrByXsakdaxREiTnQN9cfSXanKg40sQyNrjCrSz3fHFyh52MqaGhYFMq9XZKqi1nDVX6Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwTFxbGc/OtF80sx0eJ9txtpt5c/TpoZ+Ez1j3no0oRzw5cJYUh
	vM1lARJaa2lfxB4fdWy6coSgqH1aGPR3uTVvITtVFvfeQD4iUlWBy+hFce1G32iLwMlSyJfsvbF
	S0Hc8DGCjaF26VkwjQkw+z/jTid8rnxJfUh95Yh42JWJZ6CGrAUTbq12vhso=
X-Google-Smtp-Source: AGHT+IGHvOeKJug813Vob6cZJ9nEcHyAD5wgbUBvqxQDl2XEVxLYmsv6P43dyQnBUA7nkY8/30bLWX69YQNA8++fSHtmYBVm0EO2
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1542:b0:40e:9e8c:b48c with SMTP id
 e9e14a558f8ab-40e9e8cb5a2mr77954395ab.15.1757456042195; Tue, 09 Sep 2025
 15:14:02 -0700 (PDT)
Date: Tue, 09 Sep 2025 15:14:02 -0700
In-Reply-To: <aMCaviNcIeaB9SLV@linux.dev>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c0a6aa.050a0220.3c6139.0010.GAE@google.com>
Subject: Re: [syzbot] [kvmarm?] [kvm?] WARNING: locking bug in vgic_put_irq
From: syzbot <syzbot+cef594105ac7e60c6d93@syzkaller.appspotmail.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, syzkaller-bugs@googlegroups.com, will@kernel.org, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_151403_913131_B07C5BB5 
X-CRM114-Status: UNSURE (   6.09  )
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

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to copy binary to VM: failed to run ["scp" "-P" "31225" "-F" "/dev/n=
ull" "-o" "UserKnownHostsFile=3D/dev/null" "-o" "IdentitiesOnly=3Dyes" "-o"=
 "BatchMode=3Dyes" "-o" "StrictHostKeyChecking=3Dno" "-o" "ConnectTimeout=
=3D10" "/tmp/syz-executor3241787550" "root@localhost:/syz-executor324178755=
0"]: exit status 255
Connection timed out during banner exchange
Connection to 127.0.0.1 port 31225 timed out
scp: Connection closed




syzkaller build log:
go env (err=3D<nil>)
AR=3D'ar'
CC=3D'gcc'
CGO_CFLAGS=3D'-O2 -g'
CGO_CPPFLAGS=3D''
CGO_CXXFLAGS=3D'-O2 -g'
CGO_ENABLED=3D'1'
CGO_FFLAGS=3D'-O2 -g'
CGO_LDFLAGS=3D'-O2 -g'
CXX=3D'g++'
GCCGO=3D'gccgo'
GO111MODULE=3D'auto'
GOARCH=3D'arm64'
GOARM64=3D'v8.0'
GOAUTH=3D'netrc'
GOBIN=3D''
GOCACHE=3D'/syzkaller/.cache/go-build'
GOCACHEPROG=3D''
GODEBUG=3D''
GOENV=3D'/syzkaller/.config/go/env'
GOEXE=3D''
GOEXPERIMENT=3D''
GOFIPS140=3D'off'
GOFLAGS=3D''
GOGCCFLAGS=3D'-fPIC -pthread -Wl,--no-gc-sections -fmessage-length=3D0 -ffi=
le-prefix-map=3D/tmp/go-build3554905218=3D/tmp/go-build -gno-record-gcc-swi=
tches'
GOHOSTARCH=3D'arm64'
GOHOSTOS=3D'linux'
GOINSECURE=3D''
GOMOD=3D'/syzkaller/jobs/linux/gopath/src/github.com/google/syzkaller/go.mo=
d'
GOMODCACHE=3D'/syzkaller/jobs/linux/gopath/pkg/mod'
GONOPROXY=3D''
GONOSUMDB=3D''
GOOS=3D'linux'
GOPATH=3D'/syzkaller/jobs/linux/gopath'
GOPRIVATE=3D''
GOPROXY=3D'https://proxy.golang.org,direct'
GOROOT=3D'/usr/local/go'
GOSUMDB=3D'sum.golang.org'
GOTELEMETRY=3D'local'
GOTELEMETRYDIR=3D'/syzkaller/.config/go/telemetry'
GOTMPDIR=3D''
GOTOOLCHAIN=3D'auto'
GOTOOLDIR=3D'/usr/local/go/pkg/tool/linux_arm64'
GOVCS=3D''
GOVERSION=3D'go1.24.4'
GOWORK=3D''
PKG_CONFIG=3D'pkg-config'

git status (err=3D<nil>)
HEAD detached at bf27483f96
nothing to commit, working tree clean


tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
go: downloading golang.org/x/sys v0.34.0
go: downloading github.com/prometheus/client_golang v1.23.0
go: downloading github.com/prometheus/common v0.65.0
go: downloading github.com/prometheus/client_model v0.6.2
go: downloading github.com/prometheus/procfs v0.16.1
go list -f '{{.Stale}}' -ldflags=3D"-s -w -X github.com/google/syzkaller/pr=
og.GitRevision=3Dbf27483f963359281b2d9b6d6efd36289f82e282 -X github.com/goo=
gle/syzkaller/prog.gitRevisionDate=3D20250821-140520"  ./sys/syz-sysgen | g=
rep -q false || go install -ldflags=3D"-s -w -X github.com/google/syzkaller=
/prog.GitRevision=3Dbf27483f963359281b2d9b6d6efd36289f82e282 -X github.com/=
google/syzkaller/prog.gitRevisionDate=3D20250821-140520"  ./sys/syz-sysgen
make .descriptions
tput: No value for $TERM and no -T specified
tput: No value for $TERM and no -T specified
Makefile:31: run command via tools/syz-env for best compatibility, see:
Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contribut=
ing.md#using-syz-env
bin/syz-sysgen
touch .descriptions
GOOS=3Dlinux GOARCH=3Darm64 go build -ldflags=3D"-s -w -X github.com/google=
/syzkaller/prog.GitRevision=3Dbf27483f963359281b2d9b6d6efd36289f82e282 -X g=
ithub.com/google/syzkaller/prog.gitRevisionDate=3D20250821-140520"  -o ./bi=
n/linux_arm64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
mkdir -p ./bin/linux_arm64
g++ -o ./bin/linux_arm64/syz-executor executor/executor.cc \
	-O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-l=
arger-than=3D16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-ove=
rflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -stati=
c-pie -std=3Dc++17 -I. -Iexecutor/_include   -DGOOS_linux=3D1 -DGOARCH_arm6=
4=3D1 \
	-DHOSTGOOS_linux=3D1 -DGIT_REVISION=3D\"bf27483f963359281b2d9b6d6efd36289f=
82e282\"
go: downloading golang.org/x/sync v0.16.0
go: downloading golang.org/x/exp v0.0.0-20250711185948-6ae5c78190dc
go: downloading cloud.google.com/go/spanner v1.82.0
go: downloading cloud.google.com/go/bigquery v1.69.0
go: downloading github.com/sergi/go-diff v1.4.0
go: downloading google.golang.org/genproto v0.0.0-20250603155806-513f239258=
22
go: downloading google.golang.org/genproto/googleapis/api v0.0.0-2025060315=
5806-513f23925822
go: downloading github.com/GoogleCloudPlatform/opentelemetry-operations-go/=
exporter/metric v0.52.0
go: downloading github.com/GoogleCloudPlatform/opentelemetry-operations-go/=
detectors/gcp v1.28.0
go: downloading github.com/GoogleCloudPlatform/opentelemetry-operations-go/=
internal/resourcemapping v0.52.0
go: downloading github.com/golang/groupcache v0.0.0-20241129210726-2c02b820=
8cf8
go: downloading github.com/go-logr/logr v1.4.3
go: downloading github.com/goccy/go-json v0.10.5
go: downloading golang.org/x/net v0.42.0
go: downloading github.com/cncf/xds/go v0.0.0-20250501225837-2ac532fd4443
go: downloading cel.dev/expr v0.24.0
go: downloading github.com/go-jose/go-jose/v4 v4.1.0
go: downloading golang.org/x/text v0.27.0
go: downloading golang.org/x/crypto v0.40.0
/usr/bin/ld: /tmp/ccHdKQ2T.o: in function `Connection::Connect(char const*,=
 char const*)':
executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEP=
KcS1_]+0xd8): warning: Using 'gethostbyname' in statically linked applicati=
ons requires at runtime the shared libraries from the glibc version used fo=
r linking



Tested on:

commit:         2d047827 KVM: arm64: vgic: fix incorrect spinlock API ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm=
.git fixes
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da348a32a552b643=
4
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dcef594105ac7e60c6=
d93
compiler:       Debian clang version 20.1.8 (++20250708123704+0de59a293f7a-=
1~exp1~20250708003721.134), Debian LLD 20.1.8
userspace arch: arm64

Note: no patches were applied.

